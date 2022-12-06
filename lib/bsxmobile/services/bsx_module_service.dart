
import 'package:flutterlearn/bsxmobile/services/bsx_api_service.dart';
import 'package:flutterlearn/bsxmobile/services/bsx_repository.dart';

abstract class BsxModuleService {
  BsxApiService bsxApi;

  BsxModuleService({ required this.bsxApi });

  BsxRepository getRepo();

}