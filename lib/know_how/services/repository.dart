

import 'package:flutterlearn/know_how/models/response.dart';

abstract class Repository<T> {
  String endpoint;

  bool canList;
  bool canGet;
  bool canInsert;
  bool canUpdate;
  bool canDelete;


  Repository({
    required this.endpoint,

    this.canList = true,
    this.canGet = true,
    this.canInsert = true,
    this.canUpdate = true,
    this.canDelete = true,
  });

  Future<ObjResponse<List<T>>> list({ int start = 0, int limit = 10, Map<String, dynamic> params = const {} });
  Future<ObjResponse<T>> get({ dynamic id, Map<String, dynamic> params = const {} });
  Future<ObjResponse> insert({ dynamic id, required T data });
  Future<ObjResponse> update({ dynamic id, required T data } );
  Future<ObjResponse> delete({ dynamic id, Map<String, dynamic> params = const {} });
}



