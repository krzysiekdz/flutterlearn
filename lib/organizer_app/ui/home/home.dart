
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    print('Home : initState()');
  }

  @override
  Widget build(BuildContext context) {
    print('Home : build()');
    return Container(
      child: Center(child: Text('Pulpit')),
    );
  }
}