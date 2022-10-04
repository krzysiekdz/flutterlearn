import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  @override
  void initState() {
    super.initState();
    print('Calendar : initState()');
  }

  @override
  Widget build(BuildContext context) {
    print('Calendar : build()');
    return Container(
      child: Center(child: Text('Kalendarz')),
    );
  }
}