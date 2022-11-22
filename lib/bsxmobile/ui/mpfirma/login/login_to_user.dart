import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/login/login_page.dart';


class LoginToUser extends StatefulWidget {

  final Config config;
  const LoginToUser({Key? key, required this.config}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginToUserState();

}

class _LoginToUserState extends State<LoginToUser> {

  final TextEditingController login = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('LoginToUser : initState()');

    login.addListener(() {  print('login on edit = ${login.text}'); });
    password.addListener(() {  print('password on edit = ${password.text}'); });
  }

  @override
  void dispose() {
    login.dispose();
    password.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print('LoginToUser : build()');

    return LoginPage(
      child: Column(
        children: [
          Image.asset(widget.config.pathLogo, width: 120,),
          gap(h:24),

          Text('Zaloguj się', style: header3()),
          gap(),

          SizedBox(
            width: 400,
            child: Column(
              children: [
                TextField(
                  controller: login,
                ),
                gap(),

                TextField(
                  controller: password,
                ),
                gap(),

                ElevatedButton(onPressed: (){}, child: Text('Zaloguj się')),
                gap(),
                TextButton(onPressed: (){ _logoutCloud(); }, child: Text('Wyloguj się z chmury')),
              ],
            ),
          ),

        ],
      ),
    );

  }


  void _logoutCloud() {
    Navigator.of(context).pop();
  }

}

