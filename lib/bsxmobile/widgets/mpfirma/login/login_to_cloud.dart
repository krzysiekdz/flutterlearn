import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/bsx_response.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/services/modules/core.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/login/login_page.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/login/login_router.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/main.dart';
import 'package:flutterlearn/bsxmobile/widgets/shared/loader_button.dart';
import 'package:flutterlearn/bsxmobile/widgets/shared/misc.dart';


class LoginToCloud extends StatefulWidget {

  final Config config;
  const LoginToCloud({Key? key, required this.config}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginToCloudState();

}

class _LoginToCloudState extends State<LoginToCloud> {

  final TextEditingController ckey = TextEditingController();
  late final CoreRepo coreRepo;
  late final CoreService coreService;

  final _btnLoader = GlobalKey<LoaderButtonState>();
  LoaderButtonState get btnLoader => _btnLoader.currentState!;

  @override
  void initState() {
    super.initState();
    print('LoginToCloud : initState()');

    coreRepo = MpFirma.of(context).coreRepo;
    coreService = MpFirma.of(context).coreService;

    ckey.addListener(() { _keyOnChanged( ckey.text ); });
  }

  @override
  void dispose() {
    print('LoginToCloud : dispose()');
    ckey.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print('LoginToCloud : build()');

    return LoginPage(
      child: Column(
        children: [
          Logo(widget.config.pathLogo),
          gap(h:48),

          Text('Wprowadź klucz do bsxCloud', style: header3()),
          gap(h:36),

          SizedBox(
            width: 320,
            child: Column(
              children: [
                TextField(
                  controller: ckey,
                  style: header4().copyWith(letterSpacing: 5),
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.characters,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    label: Text('Klucz bsxCloud'),
                  ),
                ),
                gap(h:24),
              LoaderButton(key: _btnLoader, enabled: false, child: const Text('Dalej'), onPressed: (){ _verifyCloudKey(); }),
              ],
            ),
          ),

        ],
      ),
    );

  }

  void _verifyCloudKey() async {
    btnLoader.setLoading(true);
    BsxResponse<CloudInfo> r = await coreRepo.verifyCloudKey(key: ckey.text);
    if(!mounted) return;

    btnLoader.setLoading(false);

    if(r.isSuccess()) {
      coreService.loginToCloudFinalize(r.obj);
      _goToLoginUser();
    }
  }

  void _goToLoginUser() {
    LoginRouter.of(context).goto(LoginRoute.user);
  }

  void _keyOnChanged(String key) {
    if(key.trim() == '') { btnLoader.setDisabled(); }
    else { btnLoader.setEnabled(); }
  }

}

