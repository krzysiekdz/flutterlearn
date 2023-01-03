part of page_scaffold;


class PageScaffoldSM extends StatelessWidget {

  final RouteUrl route;

  const PageScaffoldSM({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('PageScaffold_SM : build()');

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: route.routeData.index,
        type: BottomNavigationBarType.fixed,
        onTap: (int i) { _onTapNav(i); },
        items: _buildNavItems(),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
        child: route.routeData.builder( WebPageParams(screenSize: ScreenSize.sm, routeUrl: route) )
    );
  }

  void _onTapNav( int i) {
    RouteData newRoute = getRouteDataByIndex(i, PageRoutes.all);
    AppRouter().setUrl( newRoute.path! );
  }

  List<BottomNavigationBarItem> _buildNavItems() {
    return PageRoutes.all.map((e) =>
        BottomNavigationBarItem( icon: Icon(e.icon), label: e.captionShort )
    ).toList();
  }

  AppBar _buildAppBar(BuildContext context) {
    //route moglby takze zawierac appbar, tak jak zawiera body
    return AppBar(
      title: Image.asset(AppConfig.path_logo, width: 100, height: 40,),
      actions: [
         _buildPhoneButton()
      ],
    );
  }

  Widget _buildPhoneButton() {
    return  Container(
      margin: const EdgeInsets.all(8),
      child: OutlinedButton(
        onPressed: (){ launch('tel://604281529'); },
        child: Row(
          children: [
            const Icon(Icons.phone),
            gap(),
            const Text(AppConfig.phone),
          ],
        ),
      ),
    );
  }

}