
import 'package:flutterlearn/bsxmobile/models/response.dart';
import 'package:flutterlearn/bsxmobile/services/local_storage/local_storage_service.dart';
import 'package:flutterlearn/bsxmobile/services/repository/hive_repository.dart';
import 'package:flutterlearn/bsxmobile/utils/utils.dart';
import 'package:hive_flutter/adapters.dart';

enum HiveStorageBoxes {
  _loggedData, _savedClouds
}

enum LocalStorageKey {
  _loggedCloud, _loggedUser
}

class HiveLocalStorage extends LocalStorageService {

  String keyLoggedCloud = LocalStorageKey._loggedCloud.name;
  String keyLoggedUser = LocalStorageKey._loggedUser.name;

  HiveLocalStorage();

  static bool _inited = false;

  static Future<void> init() async {
    if( !_inited ) {
      for( var b in HiveStorageBoxes.values ) {
        print('Hive : openBox( ${b.name} )');
        await Hive.openBox(b.name);
      }
      _inited = true;
    }
  }

  @override
  HiveMapRepo getLoggedDataRepo() => HiveMapRepo(endpoint: HiveStorageBoxes._loggedData.name);

  @override
  HiveMapRepo getSavedCloudsRepo() => HiveMapRepo(endpoint: HiveStorageBoxes._savedClouds.name);


  @override
  Future<void> saveLoggedCloudKey(String key) async {
    await getLoggedDataRepo().insert( id: keyLoggedCloud, data: {'key' : key });
  }

  @override
  Future<String?> getLoggedCloudKey() async {
    ObjResponse<MapSS> res =  await getLoggedDataRepo().get(id: keyLoggedCloud);
    if(res.code <= 0 ) return null;
    MapSS? map = res.obj;
    if( map == null ) return null;
    return map['key'];
  }


  @override
  Future<void> saveLoggedUser(String login, String password) async {
    await getLoggedDataRepo().insert(id: keyLoggedUser, data: {'login' : login, 'password' : password});
  }

  @override
  Future<MapSS?> getLoggedUser() async {
    ObjResponse<MapSS> res =  await getLoggedDataRepo().get(id: keyLoggedUser);
    if(res.code <= 0 ) return null;
    MapSS? map = res.obj;
    if( map == null ) return null;
    return map;
  }


  Future<void> saveCloudKey(String key, String title) async {
    await getSavedCloudsRepo().insert(
      data: {

      }
    );
  }

}







