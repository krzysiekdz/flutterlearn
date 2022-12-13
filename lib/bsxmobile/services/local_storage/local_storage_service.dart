

import 'package:flutterlearn/bsxmobile/services/repository/repository.dart';

//podobnie jak bsx module service - tam dane pochoda przewaznie z api, tutaj dane pochodza z local storage

abstract class LocalStorageService {

  Repository getLoggedCloudRepo(); //zapamietana chmura - jesli jest jakas, to odrazu logujemy do chmury/uzytkownika
  Repository getRememberedCloudsRepo(); //lista zapamietanych chmur - do wyboru przy logowaniu
  Repository getLoggedUserRepo();//zapamietany uzytkownik - jesli jest, to odrazu logujemy na uzytkownika
}