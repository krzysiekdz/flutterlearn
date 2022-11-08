
import 'package:flutter/material.dart';

class GlobalKeysTest extends StatelessWidget {

  GlobalKey<_CounterState> iden = GlobalKey<_CounterState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global keys test'),
      ),
      body: SafeArea(
        child: Center(
          child: Counter(key: iden),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Page1(iden: iden),
          ));
        },
      ),
    );
  }
}


class Counter extends StatefulWidget {
  final int c ;
  const Counter({Key? key, int? count})  : c = count ?? 0, super(key: key);

  @override
  State<StatefulWidget> createState() => _CounterState();

}

class _CounterState extends State<Counter> {

  late int counter;

  @override
  void initState() {
    super.initState();
    print(' _CounterState : initState() ');

    counter = widget.c;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      decoration:  BoxDecoration(border: Border.all(color: Colors.black54), borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){ _inc(); }, icon: const Icon(Icons.add)),
            Text('$counter', style: const TextStyle(fontSize: 32)),
            IconButton(onPressed: (){ _dec(); }, icon: const Icon(Icons.remove)),
          ],
        ),
      ),
    );
  }

  void _inc() {
    setState(() {
      counter++;
    });
  }

  void _dec() {
    setState(() {
      counter--;
    });
  }
}


class Page1 extends StatelessWidget {

  final GlobalKey<_CounterState> iden;

  final GlobalKey<_CounterState> local = GlobalKey<_CounterState>();

  Page1({ required this.iden});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        iden.currentState?.setState(() {
          iden.currentState?.counter = local.currentState?.counter ?? 0;
        });
        return Future<bool>.value(true);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Page 1'),
              SizedBox(height: 12,),
              Counter(key: local, count: iden.currentState?.counter,),
            ],
          ),
        )
      ),
    );
  }
}

