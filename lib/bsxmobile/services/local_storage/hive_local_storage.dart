
import 'package:flutterlearn/bsxmobile/models/response.dart';
import 'package:flutterlearn/bsxmobile/services/local_storage/local_storage_service.dart';
import 'package:flutterlearn/bsxmobile/services/modules/core.dart';
import 'package:flutterlearn/bsxmobile/services/modules/user.dart';
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

  String kLoggedCloud = LocalStorageKey._loggedCloud.name;
  String kLoggedUser = LocalStorageKey._loggedUser.name;

  HiveLocalStorage();

  static bool _inited = false;

  static Future<void> init() async {
    if( !_inited ) {
      print('HiveLocalStorage init()');

      await Hive.openBox<MapSS>(HiveStorageBoxes._loggedData.name);
      await Hive.openBox<MapSS>(HiveStorageBoxes._savedClouds.name);

      _inited = true;
    }
  }

  @override
  HiveMapRepo getLoggedDataRepo() => HiveMapRepo(endpoint: HiveStorageBoxes._loggedData.name);

  @override
  HiveMapRepo getSavedCloudsRepo() => HiveMapRepo(endpoint: HiveStorageBoxes._savedClouds.name);


  @override
  Future<void> saveLoggedCloudKey(Cloud cloud) async {
    await getLoggedDataRepo().insert( id: kLoggedCloud, data: {'key' : cloud.key });
  }

  @override
  Future<Cloud> getLoggedCloudKey() async {
    ObjResponse<MapSS> res =  await getLoggedDataRepo().get(id: kLoggedCloud);
    return Cloud(data: res.obj); //nie trzeba patrzec czy code > 0, bo res.obj bedzie wtedy null wiec i tak cloudInfo.isKey == false
  }


  @override
  Future<void> saveLoggedUser(User user) async {
    await getLoggedDataRepo().insert(id: kLoggedUser, data: {'login' : user.login, 'password' : user.password});
  }

  @override
  Future<User> getLoggedUser() async {
    ObjResponse<MapSS> res =  await getLoggedDataRepo().get(id: kLoggedUser);
    return User(data: res.obj);
  }


  Future<void> saveCloud(Cloud cloud) async {
    await getSavedCloudsRepo().insert(data: {'key': cloud.key, 'title': cloud.title});
  }

  @override
  Future<List<Cloud>> getSavedClouds() async {
    ObjResponse<List<MapSS>> res = await getSavedCloudsRepo().list();
    List<Cloud> clouds = [];
    res.obj?.forEach((e) { clouds.add( Cloud( data: e ) ); });
    return clouds;
  }

}







