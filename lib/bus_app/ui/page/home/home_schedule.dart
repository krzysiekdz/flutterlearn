part of bus_page_home;



class HomeSchedule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: CustomStyles.padding, left: CustomStyles.padding, right: CustomStyles.padding),
      width: double.infinity,
      decoration: const BoxDecoration(color: CustomColors.greyLight,),
      child: Column(
        children: [
          Text('Rozkłady jazdy', style: header2(),),
          linePrimary(),

          Container(
            height: 140,
            child: Stack(
              children: [

                Align(alignment: Alignment.bottomRight, child: Opacity(opacity: 0.1, child: Transform(transform: Matrix4.rotationY(2.5), child: Image.asset(AppConfig.path_road_2, )))),
                Align(alignment: Alignment.bottomRight, child: Opacity(opacity: 0.1, child: Image.asset(AppConfig.path_road_2, ))),

                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
//                      Link(text:'Kurs ${ScheduleService.nameSpySzcz}', url: UrlNames.scheduleSpySzcz),
//                      gap(),
//                      Link(text:'Kurs ${ScheduleService.nameSzczSpy}', url: UrlNames.scheduleSzczSpy),
                    ],
                  ),
                ),

              ],
            ),
          )

        ]
      ),
    );
  }
}