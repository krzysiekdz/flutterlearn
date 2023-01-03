import 'package:flutterlearn/bus_app/bus_app.dart';
import 'package:flutterlearn/bus_app/models/car.dart';

class CarData {
  static const car1 = Car(
    title: 'Bova FHD 12-340',
    places: 'miejsc: 50+1',
    descr: 'Wygodny i komfortowy autokar z pełnym wyposażeniem: klimatyzacja, barek, lodówka, DVD, nagłośnienie. Szczególnie polecany do dlugich tras',
    img: [AppConfig.a1, AppConfig.a2, AppConfig.a3],
  );

  static const car2 = Car(
    title: 'SOR C 9.5',
    places: 'miejsc: 34+1',
    descr: 'Wygodny i komfortowy autokar z pełnym wyposażeniem: klimatyzacja, barek, lodówka, DVD, nagłośnienie. Szczególnie polecany do dlugich tras',
    img: [AppConfig.a4, AppConfig.a5, AppConfig.a6, AppConfig.a7],
  );

  static const car3 = Car(
    title: 'Iveco Daily 12-340',
    places: 'miejsc: 21+1',
    descr: 'Wygodny i komfortowy autokar z pełnym wyposażeniem: klimatyzacja, barek, lodówka, DVD, nagłośnienie. Szczególnie polecany do dlugich tras',
    img: [AppConfig.a2, AppConfig.a5, AppConfig.a1],
  );
}