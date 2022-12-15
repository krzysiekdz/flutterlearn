
import 'package:flutterlearn/bsxmobile/services/local_storage/local_storage_service.dart';
import 'package:flutterlearn/bsxmobile/services/repository/hive_repository.dart';
import 'package:flutterlearn/bsxmobile/services/repository/repository.dart';
import 'package:hive_flutter/adapters.dart';

enum HiveStorageBoxes {
  loggedCloud, loggedUser, rememberedClouds
}

class HiveLocalStorage extends LocalStorageService {

  static bool _inited = false;

  static Future<void> init() async {
    if( !_inited ) {
      for( var b in HiveStorageBoxes.values ) {
        await Hive.openBox(b.name);
      }
      _inited = true;
    }
  }

  HiveLocalStorage();

  @override
  Repository getLoggedCloudRepo() {
    return HiveLoggedCloudRepo();
  }

  @override
  Repository getLoggedUserRepo() {
    return HiveLoggedUserRepo();
  }

  @override
  Repository getRememberedCloudsRepo() {
    return HiveRememberedCloudsRepo();
//    return HiveRepository(endpoint: HiveStorageBoxes.rememberedClouds.name);
  }

}

class HiveLoggedCloudRepo extends HiveRepository<String> {
  String key = 'cloudKey';
  HiveLoggedCloudRepo() : super(endpoint: HiveStorageBoxes.loggedCloud.name);
}

class HiveLoggedUserRepo extends HiveRepository<Map<String, String>> {
  String key = 'loggedUser';
  HiveLoggedUserRepo() : super(endpoint: HiveStorageBoxes.loggedUser.name);
}

class HiveRememberedCloudsRepo extends HiveRepository<Map<String, String>> {
  HiveRememberedCloudsRepo() : super(endpoint: HiveStorageBoxes.rememberedClouds.name);
}


