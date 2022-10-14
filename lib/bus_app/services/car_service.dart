
import 'package:flutterlearn/bus_app/data/sample/car_data.dart';
import 'package:flutterlearn/bus_app/models/car.dart';

abstract class CarService {
  Future<List<Car>> getCars();
}

//service przekazywac do ui - wtedy decydujemy czy dane lokalne czy z api
class CarServiceSample extends CarService {
  @override
  Future<List<Car>> getCars()  {
    List<Car> cars = [ CarData.car1, CarData.car2, CarData.car3 ];
    return Future.value(cars);
//    return Future.delayed( const Duration(seconds: 1) , () => cars );
  }
}

//class CarServiceRemote extends CarService {
//
//}