
import 'package:flutterlearn/bus_app/services/api_service.dart';
import 'package:flutterlearn/know_how/models/base_model.dart';
import 'package:flutterlearn/know_how/models/response.dart';
import 'package:flutterlearn/know_how/services/repository.dart';

class ApiRepo<T extends BaseModel> extends Repository<T> {

  ApiService apiService;

  ApiRepo({
    required super.endpoint,
    required this.apiService,

    super.canList = true,
    super.canGet = true,
    super.canInsert = true,
    super.canUpdate = true,
    super.canDelete = true,
  });



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

  @override
  Future<ObjResponse> delete({id, Map<String, dynamic> params = const {}}) {
    // TODO: implement delete
    throw UnimplementedError();
  }



}