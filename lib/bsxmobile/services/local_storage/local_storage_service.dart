

import 'package:flutterlearn/bsxmobile/services/modules/core.dart';
import 'package:flutterlearn/bsxmobile/services/modules/user.dart';
import 'package:flutterlearn/bsxmobile/services/repository/repository.dart';
import 'package:flutterlearn/bsxmobile/utils/utils.dart';


abstract class LocalStorageService {

  Repository<MapSS> getLoggedDataRepo(); //zapamietany klucz do chmury / uzytkownik
  Repository<MapSS> getSavedCloudsRepo(); //lista zapamietanych chmur;

  Future<void> saveLoggedCloudKey(Cloud cloud);
  Future<Cloud> getLoggedCloudKey();

  Future<void> saveLoggedUser(User user);
  Future<User> getLoggedUser();

  Future<void> saveCloud(Cloud cloud);
  Future<List<Cloud>> getSavedClouds();
}




