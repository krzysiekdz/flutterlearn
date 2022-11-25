import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/models/menu_data.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/main.dart';



class MainScaffold extends StatefulWidget {

  final Config config;
  const MainScaffold({Key? key, required this.config}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainScaffoldState();

  static MainScaffoldState of(BuildContext context) {
    return context.findAncestorStateOfType<MainScaffoldState>()!;
  }

}

class MainScaffoldState extends State<MainScaffold> {

  int selectedTab = 0;
  late List<MenuData> menuItems;
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    print('MainScaffold : initState()');
  }

  @override
  void dispose() {
    print('MainScaffold : dispose()');
    super.dispose();
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
      leading: const Icon(Icons.menu),
      title:  Text(widget.config.appName),
      actions: [
        IconButton(onPressed: (){ gotoLoginUser(); }, icon: const Icon(Icons.logout)),
        PopupMenuButton(
            child: const CircleAvatar(child: Text('X'),),
            itemBuilder: (context) => const [
          PopupMenuItem(value: 'opcja1', child: Text('opcja1')),
          PopupMenuItem(value: 'opcja2', child: Text('opcja2')),
          PopupMenuItem(value: 'opcja3', child: Text('opcja3')),
        ]),
        gap(w:8),
      ],

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

  void gotoLoginUser() {
    MpFirma.of(context).goto(AppRoute.loginUser);
  }

  void gotoLoginCloud() {
    MpFirma.of(context).goto(AppRoute.loginCloud);
  }

  void gotoLoginInitial() {
    MpFirma.of(context).goto(AppRoute.loginInitial);
  }

}

