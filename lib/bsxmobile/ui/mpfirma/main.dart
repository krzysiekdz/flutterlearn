import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/login/login_scaffold.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/main_scaffold/main_scaffold.dart';
import 'package:flutterlearn/utils/AppColors.dart';
import 'package:flutterlearn/utils/ThemeHelper.dart';
import 'package:provider/provider.dart';

class MpFirma extends StatefulWidget {

  final Config config;
  final AppColors colorsLight;//potem zrobic, zeby kolory szły z configu
  final AppColors colorsDark;

  const MpFirma({Key? key, required this.config, required this.colorsLight, required this.colorsDark}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MpFirmaState();

}

class _MpFirmaState extends State<MpFirma> {

  bool isLogged = false;

  @override
  void initState() {
    super.initState();
    print('MpFirma: initState()');
  }

  @override
  Widget build(BuildContext context) {
    print('MpFirma : build()');

    Widget page;
    if(isLogged) {
      page = MainScaffold(config: widget.config);
    }
    else {
      page = LoginScaffold(config: widget.config, initialRoute: LoginRoute.initial,);
    }

    return ChangeNotifierProvider<ThemeHelper>(
      create: (context) => ThemeHelper(widget.colorsLight, widget.colorsDark),
      child: page,
    );
  }
}