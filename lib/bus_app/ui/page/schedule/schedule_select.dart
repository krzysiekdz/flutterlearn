part of bus_page_schedule;


class ScheduleSelect extends WebPage with PageDataWidget {
  ScheduleSelect.route({required super.routeUrl}) : super.routeOnly();

  @override
  Widget build(BuildContext context) {
    init(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:   [
          gap(h:18),
          Text('Wybierz kurs', style: header3()),
          gap(),

          ...renderLinks(),

//          gap(h:4),
//          renderTextSelected(),
//          gap(),
//          renderLinkSpySzcz(),
//          gap(),
//          renderLinkSzczSpy()
        ],
      ),
    );
  }

//  Widget renderTextSelected() {
//    if(routeUrl.url == UrlNames.schedule || routeUrl.url == UrlNames.scheduleSpySzcz) {
//      return const Text('Wybrano: ${ScheduleService.nameSpySzcz}', style: TextStyle(color: CustomColors.primary));
//    }
//    else if (routeUrl.url == UrlNames.scheduleSzczSpy) {
//      return const Text('Wybrano: ${ScheduleService.nameSzczSpy}', style: TextStyle(color: CustomColors.primary));
//    }
//    else {
//      return const SizedBox();
//    }
//  }


  List<Widget> renderLinks() {
    List<Widget> items = [];
    for(int i = 0; i < schedules.length; i++) {
      Schedule e = schedules[i];
      items.add( renderLink(e.title, e.url) );
      items.add( gap() );
      items.add( renderLink(e.title_rev, e.url_rev) );
      items.add( gap() );
    }
    return items;
  }

  Widget renderLink(String text, String url) {
    String fullUrl = '${UrlNames.schedule}/$url';
    if (routeUrl.url == fullUrl) { return SelectedLink(text: text,   url: fullUrl ); }
    else { return ButtonLink(text: text, url: fullUrl ); }
  }
}