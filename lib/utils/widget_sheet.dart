
import 'package:flutter/material.dart';
import 'Styles.dart';


//"sciąga" w postacie szablonów widgetów do kopiowania

class Base extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        child: Center(
          child: Text('', style: Styles.header(),),
        ),
      ),
    );
  }
}

class A extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AState();
}

class _AState extends State<A> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}