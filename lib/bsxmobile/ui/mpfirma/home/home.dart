import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/data/sample.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

//zrobic jako klasa ListController
class _HomeState extends State<Home> {

  bool isLoading = true;
  late SampleData data;

  @override
  void initState() {
    super.initState();
    print('Home: initState()');
    fetchData();
  }

  void fetchData() async {
    setState(() {
      isLoading = true;
    });

    data = await Future.delayed(const Duration(seconds: 3), () => SampleData(size: 40) );

    if(!mounted) {
      print('Home : not mounted!');
      return;
    }

    print('fetch end');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Home: build()');

    Widget page;

    if(isLoading) {
      page = const Center(child: CircularProgressIndicator(),);
    }
    else {
      if(data.data.isEmpty) {
        page = _showInfo(context, 'Brak elementów');
      }
      else {
        page = _buildList(context);
      }
    }
    return page;

  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
        itemCount: data.data.length,
        itemExtent: 100,
        itemBuilder: (context, i) {
          print('ListTile $i');
          int item = data.data[i];

          return Card(
              child: ListTile(
                title: Text('$item'),
                tileColor: Theme.of(context).scaffoldBackgroundColor,
              )
          );
        }
    );
  }

  Widget _showInfo(BuildContext context, String msg) {
    return Center(child: Text(msg),);
  }
}