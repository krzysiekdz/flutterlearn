
import 'package:flutterlearn/bsxmobile/models/bsx_model.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/models/bsx_response.dart';
import 'package:flutterlearn/bsxmobile/models/session.dart';
import 'package:flutterlearn/bsxmobile/services/bsx_api_service.dart';
import 'package:flutterlearn/bsxmobile/services/bsx_module_service.dart';
import 'package:flutterlearn/bsxmobile/services/bsx_repository.dart';

class CoreService extends BsxModuleService {

  CoreService({ required Session session, required BsxApiService bsxApi, required Config config }) : super() {
    this.session = session;
    this.bsxApi = bsxApi;
    this.config = config;
    coreService = this;
    coreRepo = createRepo();
  }

  @override
  CoreRepo createRepo() => CoreRepo(bsxApi: bsxApi);

  void loginToCloudFinalize(CloudInfo cloudInfo) {
    session.cloudInfo = cloudInfo; //czyli cały pierwszy response jest zapisany w sesji
    //zapamietac w local storage key chmury - kolejne wejscie powoduje automatyczne logowanie do chmury
    //zapisac klucz do chmury w zapamietanych kluczach - lista kluczy - lista kluczy pojawia sie przy logowaniu do chmury
    //nalezy zrobic kolejny service - zapisujacy dane w local storage - klucze oraz zalogowany klucz do chmury oraz zalogowany uzytkownik
  }

}


class CoreRepo extends BsxApiRepository {

  CoreRepo({required super.bsxApi}) : super(endpoint: 'core', canList: false, canGet: false);

  Future<BsxResponse<CloudInfo>> verifyCloudKey({ required String key }) async {
    String url = '$endpoint/verifyCloudKey';
    Map<String, String> params = {'key':key};
    BsxJsonResponse r = await bsxApi.post(endpoint: url, params: params);

    return BsxResponse<CloudInfo>(response: r, obj: CloudInfo(data: r.json));
  }

}


class CloudInfo extends BsxModel {
  CloudInfo({ super.data });

  String get token => data['token'];
  String get title => data['title'];
  String get logourl => data['logourl'];
  String get key => data['key'];
  Map<String, dynamic> get services => data['services'];
  List<String> get modules => data['modules'];
  bool isModule(String m) => modules.contains(m);
}