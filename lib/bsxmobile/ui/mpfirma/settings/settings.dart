import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/data/sample.dart';

class Settings extends StatefulWidget {

  const Settings({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

//zrobic jako klasa ListController
class _SettingsState extends State<Settings> {

  bool isLoading = true;
  late SampleData data;

  @override
  void initState() {
    super.initState();
    print('Settings: initState()');
    fetchData();
  }

  void fetchData() async {
    setState(() {
      isLoading = true;
    });

    data = await Future.delayed(const Duration(seconds: 3), () => SampleData(size: 40) );

    if(!mounted) {
      print('Settings : not mounted!');
      return;
    }

    print('fetch end');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Settings: build()');

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
                tileColor: Colors.blue,
                textColor: Colors.white,
              )
          );
        }
    );
  }

  Widget _showInfo(BuildContext context, String msg) {
    return Center(child: Text(msg),);
  }
}