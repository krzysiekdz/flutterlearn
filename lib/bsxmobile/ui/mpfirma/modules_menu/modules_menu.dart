import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/data/sample.dart';

class ModulesMenu extends StatefulWidget {

  const ModulesMenu({super.key});

  @override
  State<StatefulWidget> createState() => _ModulesMenuState();
}

//zrobic jako klasa ListController
class _ModulesMenuState extends State<ModulesMenu> {

  bool isLoading = true;
  late SampleData data;

  @override
  void initState() {
    super.initState();
    print('ModulesMenu: initState()');
    fetchData();
  }

  void fetchData() async {
    setState(() {
      isLoading = true;
    });

    data = await Future.delayed(const Duration(seconds: 3), () => SampleData(size: 40) );

    if(!mounted) {
      print('ModulesMenu : not mounted!');
      return;
    }

    print('fetch end');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('ModulesMenu: build()');

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
                tileColor: Colors.green,
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