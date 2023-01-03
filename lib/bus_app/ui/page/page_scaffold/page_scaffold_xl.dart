part of page_scaffold;


class PageScaffoldXL extends StatelessWidget {

  final RouteUrl route;

  const PageScaffoldXL({Key? key, required this.route}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('PageScaffold_XL : build()');


    return Scaffold(
      appBar: AppBar(
        title: Text('PageScaffold_XL'),
      ),
      body: route.routeData.builder( WebPageParams(screenSize: ScreenSize.xl, routeUrl: route) ),
    );
  }

}