

import 'package:flutterlearn/bsxmobile/services/repository/repository.dart';
import 'package:flutterlearn/bsxmobile/utils/utils.dart';


abstract class LocalStorageService {

  Repository<MapSS> getLoggedDataRepo(); //zapamietany klucz do chmury / uzytkownik
  Repository<MapSS> getSavedCloudsRepo(); //lista zapamietanych chmur

  Future<void> saveLoggedCloudKey(String key);
  Future<String?> getLoggedCloudKey();

  Future<void> saveLoggedUser(String login, String password);
  Future<MapSS?> getLoggedUser();
}


