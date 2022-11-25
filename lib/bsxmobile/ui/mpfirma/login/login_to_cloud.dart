import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/login/login_page.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/login/login_router.dart';


class LoginToCloud extends StatefulWidget {

  final Config config;
  const LoginToCloud({Key? key, required this.config}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginToCloudState();

}

class _LoginToCloudState extends State<LoginToCloud> {

  final TextEditingController fkey = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('LoginToCloud : initState()');

    fkey.addListener(() {  print('key on edit = ${fkey.text}'); });
  }

  @override
  void dispose() {
    print('LoginToCloud : dispose()');
    fkey.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print('LoginToCloud : build()');

    return LoginPage(
      child: Column(
        children: [
          Image.asset(widget.config.pathLogo, width: 120,),
          gap(h:24),

          Text('Wprowadź klucz bsxCloud', style: header3()),
          gap(),

          SizedBox(
            width: 400,
            child: Column(
              children: [
                TextField(
                  controller: fkey,
                ),
                gap(),
                ElevatedButton(onPressed: (){ _goToLoginUser(); }, child: const Text('Dalej')),
              ],
            ),
          ),

        ],
      ),
    );

  }

  void _goToLoginUser() {
    LoginRouter.of(context).goto(LoginRoute.user);
  }
}

