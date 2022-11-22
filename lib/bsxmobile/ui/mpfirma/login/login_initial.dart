import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/login/login_page.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/login/login_scaffold.dart';


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
    Future.delayed(const Duration(seconds: 5), () => gotoLoginToCloud() );
  }

  void gotoLoginToCloud() {
    Navigator.of(context).pushNamed(LoginRoute.cloud.route);
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print('LoginInitial : build()');

    return LoginPage(
        child: Column(
          children: [
            Image.asset(widget.config.pathLogo, width: 120,),
            gap(h:24),

            const CircularProgressIndicator(),
          ],
        ),
    );
  }


}

