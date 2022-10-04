import 'package:flutter/material.dart';

import '../../../core/Functions.dart';
import '../../../core/types.dart';
import '../../utils/CommonViews.dart';




class InitialView extends StatefulWidget {

  final FunctionInt setAppView;
  final Function test;

  InitialView({Key? key, required this.setAppView, required this.test}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InitialViewState();

}

class _InitialViewState extends State<InitialView> {

  @override
  void initState() {
    super.initState();
    print('InitialView : initState()');

    resolveNextView();
  }

  @override
  void didUpdateWidget(covariant InitialView oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('InitialView : didUpdateWidget()');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('InitialView : didChangeDependencies()');
  }

  @override
  Widget build(BuildContext context) {
    print('InitialView : build()');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonViews.buildLogo(),
            gap(),
            CommonViews.getAppTitle(),
            gap(h: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  void resolveNextView() async {
    //tutaj nalezy sprawdzic, czy uzytkownik jest zapamietany
//    await Future.delayed(Duration(seconds: 5));
//    widget.setAppView(App.LOGIN_VIEW);
    //na teraz: animacja fade in/out dla pojawiania sie widgetow dla setAppView
  }
}