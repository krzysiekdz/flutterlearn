

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

  Future<ObjResponse<List<T>>> list({ int start = 0, int limit = 10, Map<String, String>? params});
  Future<ObjResponse<T>> get({ dynamic id, Map<String, String>? params});
//  Future<ObjResponse> beforeInsert({ required Map<String, String> params }) async { return ObjResponse.error('TODO'); }
  Future<ObjResponse> insert({ dynamic id, required Map<String, String> data });
  Future<ObjResponse> update({ dynamic id, required Map<String, String> data } );
  Future<ObjResponse> delete({ dynamic id, Map<String, String>? params});
}



