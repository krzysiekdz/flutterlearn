part of bus_page_home;

class HomeOffer extends StatelessWidget {

  final CarService carService = CarServiceSample();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:   const EdgeInsets.all(CustomStyles.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text('Autobusy', style: header2(),),
          linePrimary(),

          gap(),
          const Text('W ofercie posiadamy 3 autobusy', style: TextStyle(fontWeight: FontWeight.bold),),
          gap(h:18),
          buttonLink(text: 'Szczegóły', action: () { AppRouter().setUrl(UrlNames.offer); }),
          gap(h:18),

          CSlider(
              height: 200,
              items: carService.getCars2().map( (c) => CarHomeSlide(car: c) ).toList()
          ),


        ],
      ),
    );
  }
}

class CarHomeSlide extends StatelessWidget {

  final Car car;

  const CarHomeSlide({required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Image.asset(car.img[0], height: 150,),
          gap(),
          Text(car.title, style: header3(),)
        ]
    );
  }
}