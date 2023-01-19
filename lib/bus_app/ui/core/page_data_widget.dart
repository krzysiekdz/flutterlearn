
import 'package:flutterlearn/bus_app/bus_app.dart';

mixin PageDataWidget {
  late PageData? pageData;
  late PageService pageService;

  void init(BuildContext context) {
    PageScaffoldState pstate = PageScaffold.of(context);
    pageData = pstate.pageData;
    pageService = pstate.pageService;
  }

  List<News> get news => pageData?.news ?? [];
  List<News> get homeNews => pageData?.homeNews ?? [];
  List<Schedule> get schedules => pageData?.schedules ?? [];
  List<Schedule> get hours => pageData?.hours?? [];
  News? get firstNews {
    if( pageData == null || pageData!.news.isEmpty ) { return null; }
    else { return pageData!.news[0]; }
  }

  bool isMatchedSchedule(String url) => findSchedule(url) != null;

  dynamic findSchedule(String url) {
    Schedule s = Schedule(data: {});
    Schedule r = schedules.firstWhere((e) =>  '${UrlNames.schedule}/${e.url}' == url || '${UrlNames.schedule}/${e.url_rev}' == url , orElse: ()=> s );
    if( identical(r, s) ) return null;
    return r;
  }


  List<List<String>> scheduleData(String url) {
    if(schedules.isEmpty)  { return []; }
    Schedule? s = findSchedule(url);
    if( url == UrlNames.schedule ) { s = schedules[0]; }
    if(s == null) return [];
    int dir = 0;
    if(url == '${UrlNames.schedule}/${s.url_rev}') { dir = 1; }

    List<Schedule> hlist = [];
    hours.forEach((h) {
      if( dir == h.dir && h.sid == s!.id ) { hlist.add( h ); }
    });

    return mapHoursList(hlist);
  }

  List<List<String>> mapHoursList(List<Schedule> hlist) {
    if( hlist.isEmpty ) return [];
    List<List<String>> res = [];
    List<String> cities = hlist[0].cities.split(';')..removeLast();
    if(hlist[0].dir == 1) { cities = cities.reversed.toList(); }
    cities.forEach((e) {  res.add( [ e ] ); });
    hlist.forEach((e) {
      List<String> h = e.hours.split(';')..removeLast();
      for(int j = 0; j < h.length; j++) { res[j].add( h[j] ); }
    });
    return res;
  }

}