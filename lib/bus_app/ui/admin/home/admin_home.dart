library bus_admin_home;

import 'package:flutterlearn/bus_app/bus_app.dart';


part 'admin_home_menu.dart';
part 'admin_home_urgent_news.dart';
part 'admin_home_slider.dart';
part 'admin_home_urgent_news_form.dart';

typedef NavToFn = void Function(String? route, {dynamic args});

class AdminHome extends StatefulWidget {

  final ScreenSize screenSize;

  const AdminHome({required this.screenSize, super.key});

  @override
  State<StatefulWidget> createState() => _AdminHomeState();
}

enum _{
  menu, slider, news, newsForm
}



class _AdminHomeState extends State<AdminHome> with StorageBucketWidget {

  var navKey = GlobalKey<NavigatorState>();
//  late List<Page> _pages;

  @override
  void initState() {
    super.initState();
    print('AdminHome: initState()');
    initBucket(context);
//    initPages();
  }

//  void initPages() {
//    _pages = [ BusPage(name: _.menu.name, child: homeMenu) ];
//
//    if( bucket.readState(context, identifier: newsKey) == true) { _pages.add( BusPage(name: _.news.name, child: homeNews) ); }
//    if( bucket.readState(context, identifier: sliderKey) == true) { _pages.add( BusPage(name: _.slider.name, child: homeSlider) ); }
//    if( bucket.readState(context, identifier: newsFormKey) == true) { _pages.add( BusPage(name: _.newsForm.name, child: homeNewsForm()) ); }
//  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
//      onPop: _onPopPage,
//      onPush: _onPushPage,
      key: navKey,
      onGenerateRoute: _onGenerateRoute,
      initialRoute: _.menu.name,
//      restorationScopeId: 'AdminHome',
//      pages: _pages,
//      onPopPage: (route, result) {
//        _onPopPage(route.settings.name!);
//        return route.didPop(result);
//      },
    );
  }

  void navTo(String? route, {dynamic args}) {
    if( route == null ) { navKey.currentState!.pop(); }
    else { navKey.currentState!.pushNamed(route, arguments: args); }
  }

  PageStorageKey<String> get newsKey => const PageStorageKey<String>('AdminHomeUrgentNews');
  PageStorageKey<String> get sliderKey => const PageStorageKey<String>('AdminHomeSlider');
  PageStorageKey<String> get menuKey => const PageStorageKey<String>('AdminHomeMenu');
  PageStorageKey<String> get newsFormKey => const PageStorageKey<String>('AdminHomeUrgentNewsForm');

  Widget get homeNews =>  AdminHomeUrgentNews(key: newsKey);
  Widget get homeSlider =>  AdminHomeSlider(key: sliderKey);
  Widget get homeMenu => AdminHomeMenu(navTo: navTo, key: menuKey);
//  Widget homeNewsForm({dynamic arguments}) =>  AdminHomeUrgentNewsForm(formArgs: arguments, navTo: navTo, key: newsFormKey);

  Route _onGenerateRoute(RouteSettings settings) {
    Widget page;
    if(settings.name == _.news.name) { page = homeNews;  }
    else if(settings.name == _.slider.name) { page = homeSlider;  }
//    else if(settings.name == _.newsForm.name) { page = homeNewsForm(arguments: settings.arguments);  }
    else  { page = homeMenu; }

    return slideRoute( page );
  }

//  void _onPushPage(String routeName) {
//    print('push page $routeName');
//    writeRoute(routeName, true);
//  }
//
//  void _onPopPage(String routeName) {
//    print('pop page $routeName');
//    writeRoute(routeName, null);
//  }

//  void writeRoute(String routeName, dynamic value) {
//    if(routeName == _.news.name) { bucket.writeState(context, value, identifier: newsKey); }
//    else if(routeName == _.slider.name) { bucket.writeState(context, value, identifier: sliderKey); }
//    else if(routeName == _.newsForm.name) { bucket.writeState(context, value, identifier: newsFormKey); }
//  }

}



