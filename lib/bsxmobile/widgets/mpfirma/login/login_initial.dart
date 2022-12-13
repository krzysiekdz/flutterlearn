import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/login/login_page.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/login/login_router.dart';
import 'package:flutterlearn/bsxmobile/widgets/shared/misc.dart';


class LoginInitial extends StatefulWidget {

  final Config config;
  const LoginInitial({Key? key, required this.config}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginInitialState();

}

class _LoginInitialState extends State<LoginInitial> {

  @override
  void initState() {
    super.initState();
    print('LoginInitial : initState()');

    appInit();
  }

  void appInit() {
    Future.delayed(const Duration(seconds: 5), () => _gotoLoginToCloud() );
  }

  void _gotoLoginToCloud() {
    LoginRouter.of(context).goto(LoginRoute.cloud);
  }

  @override
  void dispose() {
    print('LoginInitial : dispose()');
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print('LoginInitial : build()');

    return LoginPage(
        child: Column(
          children: [
            Logo(widget.config.pathLogo),
            gap(h:48),
            const SizedBox(width: 50, height: 50,  child: CircularProgressIndicator()),
          ],
        ),
    );
  }


}
