
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
    // TODO: implement getLoggedCloudRepo
    throw UnimplementedError();
  }

  @override
  Repository getLoggedUserRepo() {
    // TODO: implement getLoggedUserRepo
    throw UnimplementedError();
  }

  @override
  Repository getRememberedCloudsRepo() {
    // TODO: implement getRememberedCloudsRepo
    throw UnimplementedError();
  }

}

class HiveLoggedCloudRepo extends HiveRepository {

  HiveLoggedCloudRepo() : super(endpoint: 'loggedCloud');

}
