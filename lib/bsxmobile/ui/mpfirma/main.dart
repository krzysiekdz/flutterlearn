import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/main_scaffold/main_scaffold.dart';

class MpFirma extends StatefulWidget {

  final Config config;

  const MpFirma({Key? key, required this.config}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MpFirmaState();

}

class _MpFirmaState extends State<MpFirma> {

  bool isLogged = true;

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
      page = MainScaffold(config: widget.config);
    }


    return page;
  }
}