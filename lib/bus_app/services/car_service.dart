
import 'package:flutterlearn/bus_app/config/app_config.dart';
import 'package:flutterlearn/bus_app/data/sample/car_data.dart';
import 'package:flutterlearn/bus_app/models/car.dart';

abstract class CarService {
  Future<List<Car>> getCars();
  List<String> getHomeCarsUrls();
  List<Car> getCars2();
}

//service przekazywac do ui - wtedy decydujemy czy dane lokalne czy z api
class CarServiceSample extends CarService {
  @override
  Future<List<Car>> getCars()  {
    List<Car> cars = [ CarData.car1, CarData.car2, CarData.car3 ];
    return Future.value(cars);
//    return Future.delayed( const Duration(seconds: 1) , () => cars );
  }

  List<String> getHomeCarsUrls() {
    List<String> urls = [ AppConfig.a1, AppConfig.a3, AppConfig.a5,];
    return urls;
  }

  List<Car> getCars2()  {
    List<Car> cars = [ CarData.car1, CarData.car2, CarData.car3 ];
    return cars;
  }
}

//class CarServiceRemote extends CarService {
//
//}