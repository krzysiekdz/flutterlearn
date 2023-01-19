import 'package:flutterlearn/bus_app/bus_app.dart';

import 'package:flutterlearn/bus_app/ui/admin/contact/admin_contact.dart';
import 'package:flutterlearn/bus_app/ui/admin/offer/admin_offer.dart';
import 'package:flutterlearn/bus_app/ui/notfound/not_found.dart';

import 'package:flutterlearn/bus_app/ui/page/contact/Contact.dart';
import 'package:flutterlearn/bus_app/ui/page/offer/offer.dart';


class UrlNames {
  static const String home = '/';
  static const String offer = '/oferta';
  static const String schedule = '/rozkład';
  static const String news = '/aktualności';
  static const String contact = '/kontakt';

  static const String scheduleSpySzcz = '$schedule/spychowo-szczytno';
  static const String scheduleSzczSpy = '$schedule/szczytno-spychowo';

  static const String admin = '/admin';
}

final RouteData not_found = RouteData(path: null, builder: (p) => NotFound(params: p));


class PageRoutes {

  static final RouteData home =
    RouteData(path: UrlNames.home, builder: (p) => Home(params: p), index: 0, captionShort: 'Główna', icon: Icons.home);
  static final RouteData offer =
    RouteData(path: UrlNames.offer, builder: (p) => Offer(params: p), index: 2, captionShort: 'Oferta', icon: Icons.bus_alert);
  static final RouteData schedule =
    RouteData(path: UrlNames.schedule, builder: (p)=> SchedulePage(params: p), index: 1, captionShort: 'Rozkład', icon: Icons.schedule);
  static final RouteData news =
    RouteData(path: UrlNames.news, builder: (p) => NewsPage(params: p), index: 3, captionShort: 'Aktualności', icon: Icons.newspaper);
  static final RouteData contact =
    RouteData(path: UrlNames.contact, builder: (p) => Contact(params: p), index: 4, captionShort: 'Kontakt', icon: Icons.contact_phone);

  static final List<RouteData> all = [ home, contact, news, offer, schedule ]
    ..sort( (a, b) => (a.index > b.index) ? 1 : -1 );

}

class AdminRoutes {

  static final RouteData home =
    RouteData(path: UrlNames.admin, builder: (p) => AdminHome(screenSize: p.screenSize, key: p.key), index: 0, captionShort: 'Główna', icon: Icons.home);
  static final RouteData offer =
    RouteData(path: UrlNames.admin + UrlNames.offer, builder: (p) => AdminOffer(screenSize: p.screenSize, key: p.key), index: 2, captionShort: 'Oferta', icon: Icons.bus_alert);
  static final RouteData schedule =
    RouteData(path: UrlNames.admin + UrlNames.schedule, builder: (p)=> AdminSchedule(screenSize: p.screenSize, key: p.key), index: 1, captionShort: 'Rozkład', icon: Icons.schedule);
  static final RouteData news =
    RouteData(path: UrlNames.admin + UrlNames.news, builder: (p) => AdminNews(screenSize: p.screenSize, key: p.key), index: 3, captionShort: 'Aktualności', icon: Icons.newspaper);
  static final RouteData contact =
    RouteData(path: UrlNames.admin + UrlNames.contact, builder: (p) => AdminContact(screenSize: p.screenSize, key: p.key), index: 4, captionShort: 'Kontakt', icon: Icons.contact_phone);


  static final List<RouteData> all = [ home, contact, offer, schedule, news ]
    ..sort( (a, b) => (a.index > b.index) ? 1 : -1 );
}


