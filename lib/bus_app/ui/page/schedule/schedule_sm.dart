part of bus_page_schedule;

class ScheduleSM extends WebPage with PageDataWidget {
  ScheduleSM.route({required super.routeUrl}) : super.routeOnly();

  @override
  Widget build(BuildContext context) {
    init(context);

    print('Schedule: ${routeUrl.url}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:   [
         const Header(title: 'Rozkłady jazdy'),
         ScheduleSelect.route(routeUrl: routeUrl),
//         if( ScheduleService.notFound(routeUrl.url) ) CPadding(child: Text('Nie znaleziono kursu', style: header2(),)),
         if( isMatchedSchedule(routeUrl.url) || routeUrl.url == UrlNames.schedule) ScheduleTable3(data: scheduleData(routeUrl.url), title: title(),), //sprawdzic jeszcze resolveWith
      ],
    );
  }

  String title() {
    return ScheduleService.getTitle(routeUrl.url);
  }

}