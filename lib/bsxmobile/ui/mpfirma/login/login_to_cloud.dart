import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/login/login_page.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/login/login_router.dart';
import 'package:flutterlearn/bsxmobile/ui/widgets/misc.dart';


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
          Logo(widget.config.pathLogo),
          gap(h:48),

          Text('Wprowadź klucz do bsxCloud', style: header3()),
          gap(h:36),

          SizedBox(
            width: 320,
            child: Column(
              children: [
                TextField(
                  controller: fkey,
                  style: header4().copyWith(letterSpacing: 5),
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.characters,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    label: Text('Klucz bsxCloud'),
                  ),
                ),
                gap(h:24),
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

