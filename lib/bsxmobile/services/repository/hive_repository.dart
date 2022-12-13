

import 'package:flutterlearn/bsxmobile/models/response.dart';
import 'package:flutterlearn/bsxmobile/services/repository/repository.dart';

class HiveRepository<T> extends Repository {

  HiveRepository({required super.endpoint});


  @override
  Future<ObjResponse<List<T>>> list({int start = 0, int limit = 10, Map<String, dynamic> params = const {}}) {
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  Future<ObjResponse<T>> get({int id = 0, Map<String, dynamic> params = const {}}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<ObjResponse> insert({Map<String, dynamic> params = const {}}) {
    // TODO: implement insert
    throw UnimplementedError();
  }


  @override
  Future<ObjResponse> update({Map<String, dynamic> params = const {}}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<ObjResponse> delete({int id = 0, Map<String, dynamic> params = const {}}) {
    // TODO: implement delete
    throw UnimplementedError();
  }


}
