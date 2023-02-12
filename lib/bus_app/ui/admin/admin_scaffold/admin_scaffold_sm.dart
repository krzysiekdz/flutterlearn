part of bus_admin_main;

class AdminScaffold_SM extends StatefulWidget {

  const AdminScaffold_SM({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AdminSM_State();

}

class _AdminSM_State extends State<AdminScaffold_SM> {

  int selectedTab = 0;
//  final PageStorageBucket _bucket = PageStorageBucket();

  final PageController pageController = PageController();

  AdminState get adminState => context.findAncestorStateOfType<AdminState>()!;

  @override
  void initState() {
    super.initState();
    print('AdminScaffold_SM : initState()');
  }

  void setTab(int i) {
    setState(() {
      selectedTab = i;
      if(i != pageController.page)  { pageController.jumpToPage(i); }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('AdminScaffold_SM : build()');

    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

//  Widget _buildBody() {
//    return SafeArea(
//        child: PageStorage(
//            bucket: _bucket,
//            child: getViewForTab()
//        )
//    );
//  }

  Widget _buildBody() {
    int len = AdminRoutes.all.length;
    return SafeArea(
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
//          onPageChanged: (i){ setTab(i); },
          children: [ for(int i = 0; i < len; i++) getViewForTab(i),  ]
        )
    );
  }

  Widget getViewForTab(int i) {
    RouteData newRoute = getRouteDataByIndex(i, AdminRoutes.all);
    return newRoute.builder(WebPageParams(
        screenSize: ScreenSize.sm,
        routeUrl: RouteUrl(url: UrlNames.admin, routeData: AdminRoutes.home),//nieistotne
//        key: PageStorageKey<int>(selectedTab),
        adminState: adminState,
    ));
  }


  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: selectedTab,
      type: BottomNavigationBarType.fixed,
      onTap: (int i) { onTapNav(i); },
      items: _buildNavItems(),
    );
  }

  void onTapNav( int i) {
    setTab(i);
  }

  List<BottomNavigationBarItem> _buildNavItems() {
    return AdminRoutes.all.map((e) =>
        BottomNavigationBarItem( icon: Icon(e.icon), label: e.captionShort )
    ).toList();
  }
}

