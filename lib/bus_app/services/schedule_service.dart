import 'package:flutterlearn/bus_app/config/routes.dart';
import '../data/sample/schedule_data.dart';

class ScheduleService {

  static final routes = [ UrlNames.scheduleSpySzcz, UrlNames.scheduleSzczSpy ];

  static const nameSpySzcz = 'Spychowo - Szczytno';
  static const nameSzczSpy = 'Szczytno - Spychowo';

  static bool isMatched(String url) {
    return routes.contains(url);
  }

  static bool notFound(String url) {
    return !routes.contains(url) && url != UrlNames.schedule;
  }

  static String getTitle(String url) {
    if( notFound(url) ) { return 'Nie znaleziono!'; }
    else {
      String s = '';
      if( url == UrlNames.scheduleSzczSpy ) { s = nameSzczSpy; }
      else if( url == UrlNames.scheduleSpySzcz) { s = nameSpySzcz; }
      return s;
    }
  }

  static List<List<String>> getData(String url) {
    if( notFound(url) ) { return []; }
    else {
      if( url == UrlNames.scheduleSzczSpy ) { return ScheduleData.szcz_spy; }
      else if( url == UrlNames.scheduleSpySzcz) { return ScheduleData.spy_szcz; }
      else { return []; }
    }
  }
}