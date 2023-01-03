library bus_page_home;

import 'package:flutterlearn/bus_app/bus_app.dart';

part 'home_sm.dart';
part 'home_xl.dart';
part 'home_contact.dart';
part 'home_urgent_news.dart';
part 'home_news_link.dart';
part 'home_offer.dart';
part 'home_schedule.dart';
part 'home_slider.dart';



class Home extends WebPage {
  Home({required super.params});


  @override
  Widget build(BuildContext context) {
    Widget page;
    if(screenSize == ScreenSize.sm) { page = Home_SM.route(routeUrl: routeUrl); }
    else { page = Home_SM.route(routeUrl: routeUrl); }

    return page;
  }
}