
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