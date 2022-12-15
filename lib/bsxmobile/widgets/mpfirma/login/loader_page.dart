import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/login/login_page.dart';
import 'package:flutterlearn/bsxmobile/widgets/shared/misc.dart';


class LoaderPage extends StatefulWidget {

  final Config config;
  const LoaderPage({Key? key, required this.config}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoaderPageState();

}

class _LoaderPageState extends State<LoaderPage> {

  @override
  void initState() {
    super.initState();
    print('LoaderPage : initState()');
  }

  @override
  void dispose() {
    print('LoaderPage : dispose()');
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print('LoaderPage : build()');

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

