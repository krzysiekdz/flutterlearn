
import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/models/menu_data.dart';



class MainScaffold extends StatefulWidget {

  final Config config;
  const MainScaffold({Key? key, required this.config}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScaffoldState();

}

class _MainScaffoldState extends State<MainScaffold> {

  int selectedTab = 0;
  late List<MenuData> menuItems;
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    print('MainScaffold : initState()');
  }

  void setTab(int i) {
    setState(() {
      selectedTab = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MainScaffold : build()');
    menuItems = widget.config.bottomNav;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title:  Text(widget.config.appName),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
        child: PageStorage(
            bucket: _bucket,
            child: _getViewForTab(context)
        )
    );
  }

  Widget _getViewForTab(BuildContext context) {
    return menuItems[selectedTab].builder(MenuPageParams(
        context: context,
        key: PageStorageKey<int>(selectedTab)
    ));
  }


  Widget _buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedTab,
      type: BottomNavigationBarType.fixed,
      onTap: (int i) { onTapNav(i); },
      items: _buildNavItems(),
    );
  }

  void onTapNav( int i) {
    if(selectedTab == i) {
      return;
    }
    setTab(i);
  }

  List<BottomNavigationBarItem> _buildNavItems() {
    return menuItems.map((e) =>
        BottomNavigationBarItem( icon: Icon(e.icon), label: e.caption )
    ).toList();
  }
}

