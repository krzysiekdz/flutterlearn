import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/models/bsx_response.dart';
import 'package:flutterlearn/bsxmobile/models/session.dart';
import 'package:flutterlearn/bsxmobile/services/bsx_api_service.dart';
import 'package:flutterlearn/bsxmobile/services/modules/core.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/login/login_router.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/main_scaffold/main_scaffold.dart';
import 'package:flutterlearn/bsxmobile/utils/misc.dart';
import 'package:flutterlearn/utils/AppColors.dart';
import 'package:flutterlearn/utils/ThemeHelper.dart';
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
  main, loginUser, loginCloud, loginInitial
}

class MpFirmaState extends State<MpFirma> {

  final _navKey = GlobalKey<NavigatorState>();

  late BsxApiService bsxApi;
  late Session session;
  late CoreService coreService;
  late CoreRepo coreRepo;

  Config get config => widget.config;

  @override
  void initState() {
    super.initState();
    print('MpFirma: initState()');

    _init();
  }

  void _init() {
    session = Session();
    bsxApi = BsxApiService(config: config, session: session, handleResult: bsxResponseHandler);
    coreService = CoreService(session: session, bsxApi: bsxApi, config: config);
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
          initialRoute: AppRoute.loginInitial.name,
        ),
      ),
    );
  }

  void goto(AppRoute route) {
    _navKey.currentState!.pushNamedAndRemoveUntil(route.name,  (route) => false);
  }

  //w app barze zrobic listę akcji - wyloguj z chmury, uzytkownika, zamknij apliakcje
  Route _onGenerateRoute(RouteSettings settings) {
    Widget page;

    if(settings.name == AppRoute.main.name) {
      page = MainScaffold(config: widget.config);
    }
    else if(settings.name == AppRoute.loginUser.name) {
      page = LoginRouter(config: widget.config, initialRoute: LoginRoute.user,);
    }
    else if(settings.name == AppRoute.loginCloud.name) {
      page = LoginRouter(config: widget.config, initialRoute: LoginRoute.cloud,);
    }
    else  {
      page = LoginRouter(config: widget.config, initialRoute: LoginRoute.initial);
    }

    return slideRoute(page);
  }

  BsxRawResponse bsxResponseHandler(BsxRawResponse res) {
    if(res.isError()) {
      showDialog(context: context, builder: (context) =>
          AlertDialog(
            title: Row(
              children: [
                const Icon(Icons.dangerous_outlined),
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