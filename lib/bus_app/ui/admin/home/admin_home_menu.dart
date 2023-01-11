part of bus_admin_home;


class AdminHomeMenu extends StatefulWidget {

  Function(String?) navTo;
  AdminHomeMenu({super.key, required this.navTo});

  @override
  State<StatefulWidget> createState() => _AdminHomeMenuState();
}


class _AdminHomeMenuState extends State<AdminHomeMenu> {

  late List<Widget> items;

  @override
  void initState() {
    super.initState();
    print('AdminHomeMenu: initState()');

    items = [
      MenuButton(color: Colors.orange, caption: 'Ogłoszenia', iconData: Icons.warning, onTap: (){ onTapButton(_.news.name); },),
      MenuButton(color: Colors.purple, caption: 'Slajdy', iconData: Icons.image, onTap: (){ onTapButton(_.slider.name); }),
    ];
  }

  void onTapButton(String route) {
    widget.navTo( route );
  }

  @override
  Widget build(BuildContext context) {
    ListView list;
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


