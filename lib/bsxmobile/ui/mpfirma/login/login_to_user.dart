import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/login/login_page.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/login/login_router.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/main.dart';
import 'package:flutterlearn/bsxmobile/ui/widgets/misc.dart';


class LoginToUser extends StatefulWidget {

  final Config config;
  const LoginToUser({Key? key, required this.config}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginToUserState();

}

class _LoginToUserState extends State<LoginToUser> {

  final TextEditingController login = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    print('LoginToUser : initState()');

    login.addListener(() {  print('login on edit = ${login.text}'); });
    password.addListener(() {  print('password on edit = ${password.text}'); });
  }

  @override
  void dispose() {
    print('LoginToUser : dispose()');
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
          Logo(widget.config.pathLogo),
          gap(h:48),

          Text('Zaloguj się', style: header3()),
          gap(h:36),

          SizedBox(
            width: 320,
            child: Column(
              children: [
                TextField(
                  controller: login,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    label: Text('Login'),
                  ),
                ),
                gap(h:24),

                //zrobic kontrolke typu password
                TextField(
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: !showPassword,
                  decoration:  InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    label: const Text('Hasło'),
                    suffixIcon: IconButton(
                        icon: showPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                        onPressed: (){ _toggleShowPassword(); }
                        ),
                  ),
                ),
                gap(h:24),

                ElevatedButton(onPressed: (){ _logIn(); }, child: const Text('Zaloguj się')),
                gap(),
                TextButton(onPressed: (){ _logoutCloud(); }, child: const Text('Wyloguj się z chmury')),
              ],
            ),
          ),

        ],
      ),
    );

  }

  void _toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void _logoutCloud() {
    LoginRouter.of(context).goto(LoginRoute.cloud);
  }

  void _logIn() {
    MpFirma.of(context).goto(AppRoute.main);
  }

}

