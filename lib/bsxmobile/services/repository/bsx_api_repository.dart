

import 'package:flutterlearn/bsxmobile/models/bsx_model.dart';
import 'package:flutterlearn/bsxmobile/models/response.dart';
import 'package:flutterlearn/bsxmobile/services/bsx_api_service.dart';
import 'package:flutterlearn/bsxmobile/services/repository/repository.dart';

class BsxApiRepository<T extends BsxModel> extends Repository<T> {
  BsxApiService bsxApi;

  bool canPreview;
  bool canExport;
  bool canImport;

  BsxApiRepository({
    required super.endpoint,
    required this.bsxApi,

    super.canList = true,
    super.canGet = true,
    super.canInsert = true,
    super.canUpdate = true,
    super.canDelete = true,

    this.canPreview = false,
    this.canExport = false,
    this.canImport = false,
  });

  @override
  Future<ObjResponse> delete({id, Map<String, dynamic> params = const {}}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ObjResponse<T>> get({id, Map<String, dynamic> params = const {}}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<ObjResponse> insert({id, required T data}) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<ObjResponse<List<T>>> list({int start = 0, int limit = 10, Map<String, dynamic> params = const {}}) {
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  Future<ObjResponse> update({id, required T data}) {
    // TODO: implement update
    throw UnimplementedError();
  }






}