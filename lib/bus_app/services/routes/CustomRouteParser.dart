
import 'package:flutterlearn/bus_app/bus_app.dart';
import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/utils/misc.dart';


class CustomRouteParser  extends RouteInformationParser<RouteUrl> {

  @override
  Future<RouteUrl> parseRouteInformation(RouteInformation routeInformation) async {
    print('CustomRouteParser : parseRouteInformation = ${routeInformation.location}');

    String url = routeInformation.location ?? UrlNames.home;
    return parseUrl( Uri.decodeFull(url) );
  }

  //here we can ovverride url, for example: /admin/* => shows as /admin
  /*
  * example logs, when type '/admin/abc' in browser
  * CustomRouteParser : parseRouteInformation = /admin/abc
    AppRouter : setNewRoutePath = /admin
    AppRouter: get currentConfiguration = /admin
    CustomRouteParser : restoreRouteInformation = /admin
  * */
  @override
  RouteInformation? restoreRouteInformation(RouteUrl configuration) {
    print('CustomRouteParser : restoreRouteInformation = ${configuration.url}');

    return RouteInformation(location: Uri.encodeFull(configuration.url) );
  }


  static RouteUrl parseUrl(String url) {
    RouteData routeData = getRouteData(url, PageRoutes.all);
    if( routeData.isUnknown ) {
      if( url == UrlNames.admin || url.startsWith( '${UrlNames.admin}/' ) ) {
        routeData = AdminRoutes.home;
        url = UrlNames.admin; //all urls that starts with 'admin' are replacing to 'admin'
      }
      else {
        routeData = not_found;
      }
      //routeData = getRouteData(url, AdminRoutes.all);
    }
    return RouteUrl(url: url, routeData: routeData );
  }

}