import 'package:flutterlearn/bus_app/bus_app.dart';


class AdminNews extends StatefulWidget {

  final ScreenSize screenSize;

  const AdminNews({required this.screenSize, super.key});

  @override
  State<StatefulWidget> createState() => _AdminNewsState();

}

class _AdminNewsState extends State<AdminNews> {

  @override
  void initState() {
    super.initState();
    print('AdminNews: initState()');
  }

  @override
  Widget build(BuildContext context) {
    print('AdminNews: build()');

    Widget page;
    if(widget.screenSize == ScreenSize.sm) { page = Center(child: Text('News small'),); }
    else { page = Center(child: Text('News LARGE'),); }

    return page;

  }
}