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



Route slideRoute(Widget page, {RouteSettings? settings}) {
  return PageRouteBuilder(
    settings: settings,
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween(begin: const Offset(1, 0), end: Offset.zero)
          .chain(CurveTween(curve: Curves.easeOut));

//      return SlideTransition(position: tween.animate(animation), child: child);

      return SlideTransition(
        position: animation.drive(tween), //tween.animate(animation);
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}

class BusPage extends Page {
  final Widget child;

  BusPage({ required this.child, super.name });

  @override
  Route createRoute(BuildContext context) {
    return slideRoute(child, settings: this);
  }

}



