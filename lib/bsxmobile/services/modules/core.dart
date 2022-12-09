
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

}


class CoreRepo extends BsxApiRepository {

  CoreRepo({required super.bsxApi}) : super(endpoint: 'core', canList: false, canGet: false);

  Future<BsxResponse<CloudInfo>> verifyCloudKey({ required String key }) async {
    String url = '$endpoint/verifyCloudKey';
    Map<String, String> params = {'key':key};
    BsxRawResponse r = await bsxApi.post(endpoint: url, params: params);

    return BsxResponse<CloudInfo>(response: r, obj: CloudInfo(data: r.raw));
  }

}


class CloudInfo extends BsxModel {
  CloudInfo({ super.data });
}