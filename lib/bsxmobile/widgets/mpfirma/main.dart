import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/models/response.dart';
import 'package:flutterlearn/bsxmobile/models/session.dart';
import 'package:flutterlearn/bsxmobile/services/bsx_api_service.dart';
import 'package:flutterlearn/bsxmobile/services/local_storage/hive_local_storage.dart';
import 'package:flutterlearn/bsxmobile/services/local_storage/local_storage_service.dart';
import 'package:flutterlearn/bsxmobile/services/modules/core.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/login/loader_page.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/login/login_to_cloud.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/login/login_to_user.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/main_scaffold/main_scaffold.dart';
import 'package:flutterlearn/bsxmobile/utils/misc.dart';
import 'package:flutterlearn/utils/AppColors.dart';
import 'package:flutterlearn/utils/ThemeHelper.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class MpFirma extends StatefulWidget {

  final Config config;
  final AppColors colorsLight;//potem zrobic, zeby kolory szły z configu
  final AppColors colorsDark;

  const MpFirma({Key? key, required this.config, required this.colorsLight, required this.colorsDark}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MpFirmaState();

  static MpFirmaState of(BuildContext context) {
     return context.findAncestorStateOfType<MpFirmaState>()!;
  }

}

enum AppRoute {
  main, loginToUser, loginToCloud, loaderPage
}

class MpFirmaState extends State<MpFirma> {

  final _navKey = GlobalKey<NavigatorState>();

  late BsxApiService bsxApi;
  late Session session;
  late CoreService coreService;
  late CoreRepo coreRepo;
  late LocalStorageService localStorage;
  Config get config => widget.config;


  @override
  void initState() {
    super.initState();
    print('MpFirma: initState()');

    _appInit();
  }


  /*
  * inicjalizacja aplikacji - jednorazowo, na starcie (ekran ładowania)
  * */
  Future<void> _appInit() async {
    Stopwatch s = Stopwatch()..start();
    await Hive.initFlutter(); //jeśli uzywamy hive, to tutaj jednorazowa inicjalizacja
    await HiveLocalStorage.init(); // inicjalizacja hive storage

    s.stop();
    print('MpFirma: init time = ${s.elapsedMilliseconds} [ms]');
    await Future.delayed( const Duration(seconds: 2) );
    if(!mounted) return;

    _newState();
    _autoLogin();
  }

  /*
  * rozpoznanie, czy zalogowany do chmury/uzytkownika - logowanie
  * */
  Future<void> _autoLogin() async {
    //if zapamietany uzytkownik then logowanie do chmury i na uzytkownika; goto main scaffold
    //else if zapamietany klucz do chmury => logowanie do chmury; goto loginToUser
    //else
    goto(AppRoute.loginToCloud);
  }

  void _newState() {
    session = Session();
    bsxApi = BsxApiService(config: config, session: session, responseHandler: bsxResponseHandler);
    localStorage = HiveLocalStorage();
    coreService = CoreService(session: session, bsxApi: bsxApi, config: config, localStorage: localStorage);
    coreRepo = coreService.coreRepo;
  }

  @override
  Widget build(BuildContext context) {
    print('MpFirma : build()');

    return WillPopScope(
      onWillPop: _canExitApp,
      child: ChangeNotifierProvider<ThemeHelper>(
        create: (context) => ThemeHelper(widget.colorsLight, widget.colorsDark),
        child: Navigator(
          key: _navKey,
          onGenerateRoute: _onGenerateRoute,
          initialRoute: AppRoute.loaderPage.name, //na poczatku wchodzimy na LoaderPage, gdzie nie jest wymagany zaden service, bo aplikacja się dopiero inicjalizuje
        ),
      ),
    );
  }

  void logoutAndForgetUser() {
    goto(AppRoute.loaderPage);
    //wylogowac sie z api
    _newState();
    //usunac zapamietanego uzytkownika
    _autoLogin();
  }

  void logoutCloud() {
    goto(AppRoute.loaderPage);
    //wylogowac z api
    _newState();
    //usunac zapamietanego uzytkownika oraz chmure
    goto(AppRoute.loginToCloud);
  }

  void goto(AppRoute route) {
    _navKey.currentState!.pushNamedAndRemoveUntil(route.name,  (route) => false);
  }

  //routing aplikacji
  Route _onGenerateRoute(RouteSettings settings) {
    Widget page;

    if(settings.name == AppRoute.main.name) {
      page = MainScaffold(config: config);
    }
    else if(settings.name == AppRoute.loginToUser.name) {
      page = LoginToUser(config: config);
    }
    else if(settings.name == AppRoute.loginToCloud.name) {
      page = LoginToCloud(config: config);
    }
    else  {
      page = LoaderPage(config: config);
    }

    return slideRoute(page);
  }

  //globalna obsługa bsxApi response
  JsonResponse bsxResponseHandler(JsonResponse res) {
    if(res.isError()) {
      showDialog(context: context, builder: (context) =>
          AlertDialog(
            title: Row(
              children: [
                const Icon(Icons.warning),
                gap(),
                const Text('Wystąpił błąd')
              ],
            ),
            content: Text(res.msg, style: const TextStyle(color: Colors.redAccent),),
            actions: [
              ElevatedButton(onPressed: (){ Navigator.of(context).pop(); }, child: const Text('OK'))
            ],
          )
      );
    }

    return res;
  }

  //wyjscie z aplikacji - dialog czy na pewno?
  Future<bool> _canExitApp() async {
      bool result = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Row(
                children: [
                  Image.asset(widget.config.pathLogo, width: 40,),
                  gap(),
                  Text(widget.config.appName)
                ],
              ),
              content: const Text('Czy chcesz zamknąć aplikację?'),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 120, child: TextButton(onPressed: (){ Navigator.of(context).pop(false); }, child: const Text('Anuluj'))),
                    SizedBox(width: 120, child: ElevatedButton(onPressed: (){ Navigator.of(context).pop(true); }, child: const Text('Zamknij'))),
                  ],
                )
              ],
            );
          }
      );

      return result;
  }

}