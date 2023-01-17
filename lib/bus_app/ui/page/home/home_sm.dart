part of bus_page_home;


class Home_SM extends WebPage with PageDataWidget {

  Home_SM.route({required super.routeUrl}) : super.routeOnly();

  @override
  Widget build(BuildContext context) {
    init(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HomeSlider(alignment: Alignment.centerLeft,),

          if(homeNews.isNotEmpty) ...[ HomeUrgentNews(), gap() ],

          HomeSchedule(),  gap(),

          HomeOffer(), gap(),

          if( firstNews != null ) ...[HomeNewsLink(), gap()],

          HomeContact(),
        ],
      ),
    );
  }




}