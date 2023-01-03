library bus_admin_home;

import 'package:flutterlearn/bus_app/bus_app.dart';


class AdminHome extends StatefulWidget {

  final ScreenSize screenSize;

  const AdminHome({required this.screenSize, super.key});

  @override
  State<StatefulWidget> createState() => _AdminHomeState();
}


class _AdminHomeState extends State<AdminHome> {

  List<Widget> items = [
    const HomeMenuItem(index: 2, caption: 'Ogłoszenia', iconData: Icons.warning),
    const HomeMenuItem(index: 3, caption: 'Slajdy', iconData: Icons.image),
  ];

  @override
  void initState() {
    super.initState();
    print('AdminHome: initState()');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(CustomStyles.padding),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.start,
          runSpacing: 12,
          spacing: 12,
          children: items,
        ),
      ),
    );
  }

}

Color _getColor(int i) {
  int count = 5;
  if(i % count == 0) { return Colors.orange; }
  else if(i % count == 1) { return Colors.green; }
  else if(i % count == 2) { return Colors.blue; }
  else if(i % count == 3) { return Colors.purpleAccent; }
  else  { return Colors.yellow; }
}

class HomeMenuItem extends StatelessWidget {

  final int index;
  final String caption;
  final IconData iconData;

  const HomeMenuItem({super.key,  required this.index, required this.caption, required this.iconData });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () { print('$index'); },
      child: Container(
        width: 120,
        height: 120,
        padding: const EdgeInsets.all(CustomStyles.padding),
//        decoration: BoxDecoration(
//          color: _getColor(index),
//          borderRadius: BorderRadius.circular(CustomStyles.borderRadius),
//        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData),
            gap(),
            Text(caption, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}