
import 'package:flutterlearn/bsxmobile/models/bsx_model.dart';
import 'package:flutterlearn/bsxmobile/models/response.dart';
import 'package:flutterlearn/bsxmobile/services/bsx_module_service.dart';
import 'package:flutterlearn/bsxmobile/services/bsx_repository.dart';

class CoreService extends BsxModuleService {

  CoreService({ required super.bsxApi });

  @override
  CoreRepo getRepo() => CoreRepo(bsxApi: bsxApi);

}

class CoreRepo extends BsxApiRepository {


  CoreRepo({required super.bsxApi}) : super(endpoint: 'core', canList: false, canGet: false);

  Future<CloudResult> verifyCloudKey({ required String key }) async{
    String url = '$endpoint/verifyCloudKey';
    Map<String, String> params = {'key':key};

    Response r = await bsxApi.post(endpoint: url, params: params);
//    if( r.isSuccess() ) {
//      CloudResult cloudResult = CloudResult();
//
//    }

    //co ma byc odpowiedzia?  czy jednak zwracac response? i zakladac ze data bedzie okreslonego typu? chyba tak
    return CloudResult();

  }


}


class CloudResult extends BsxModel {
  CloudResult({ super.data });
}