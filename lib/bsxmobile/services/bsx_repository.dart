

import 'package:flutterlearn/bsxmobile/services/bsx_api_service.dart';

abstract class BsxRepository<T> {
  String endpoint;

  bool canList;
  bool canGet;
  bool canInsert;
  bool canUpdate;
  bool canDelete;
  bool canPreview;
  bool canExport;
  bool canImport;

  BsxRepository({
    required this.endpoint,

    this.canList = true,
    this.canGet = true,
    this.canInsert = true,
    this.canUpdate = true,
    this.canDelete = true,

    this.canPreview = false,
    this.canExport = false,
    this.canImport = false,
  });

  Future<List<T>> list({ int start = 0, int limit = 10, Map<String, dynamic> params = const {} });
  Future<T> get({ Map<String, dynamic> params = const {} });
}



class BsxApiRepository<T> extends BsxRepository {
  BsxApiService bsxApi;

  BsxApiRepository({
    required super.endpoint,
    required this.bsxApi,

    super.canList = true,
    super.canGet = true,
    super.canInsert = true,
    super.canUpdate = true,
    super.canDelete = true,

    super.canPreview = false,
    super.canExport = false,
    super.canImport = false,
  });

  @override
  Future<List<T>> list({int start = 0, int limit = 10, Map<String, dynamic> params = const {}}) async{
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  Future<T> get({Map<String, dynamic> params = const {}}) {
    // TODO: implement get
    throw UnimplementedError();
  }




}

//class BsxInMemoryRepository extends BsxRepository {}