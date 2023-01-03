import 'package:flutterlearn/bus_app/bus_app.dart';

ScreenSize resolveScreenSize(BuildContext context) {
  double w = MediaQuery.of(context).size.width;

  if( w <= AppConfig.WIDTH_SM ) { return ScreenSize.sm; }
  else { return ScreenSize.xl; }
}


RouteData getRouteData(String url, List<RouteData> all) {
  bool test(RouteData i) {
    if(i.path == '/') { return url == '/'; }
    else { return  (url == i.path) ||  url.startsWith('${i.path!}/'); }
  }
  return all.firstWhere( test , orElse: () => not_found);
}

RouteData getRouteDataByIndex(int index, List<RouteData> all) {
  return all.firstWhere((i) => i.index == index, orElse: () => all[0] );
}


