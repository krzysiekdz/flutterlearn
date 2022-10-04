
import 'dart:math';
import 'package:flutter/material.dart';

class InheritedWidgetExample extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _InheritedWidgetExampleState();
}

class _InheritedWidgetExampleState extends State<InheritedWidgetExample> {

  int score = 0;
  final Random random = Random();
  final key = GlobalKey();

  void generate() {
    setState(() {
      score = random.nextInt(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild state');
    return ScoreData(
      score: score,
      generateFn: generate,
      child: Info(),
      key: key,
    );
  }
}

class ScoreData extends InheritedWidget {
  final int score;
  final Function generateFn;

  ScoreData({Key? key, required Widget child, required this.score, required this.generateFn}) : super(key: key, child: child) {
    print('ScoreData constructor');
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    print('ScoreData : updateShouldNotify()');
    return false;
  }

  static ScoreData of(BuildContext context) {
     return context.dependOnInheritedWidgetOfExactType<ScoreData>()!;
  }

}

class Info extends StatelessWidget {
  Info({Key? key}) : super(key: key) {
    print('Info constructor()');
  }

  @override
  Widget build(BuildContext context) {
    final scoreData = ScoreData.of(context);

    print('Info : build(), score = ${scoreData.score}');

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text('score = ${scoreData.score}'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { scoreData.generateFn(); },
        child: const Icon(Icons.refresh),
      ),
    );
  }

}