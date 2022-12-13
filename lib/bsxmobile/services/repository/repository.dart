
import 'package:flutterlearn/bsxmobile/models/response.dart';

//przeniesc pozniej do globalnego utils
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
  Future<ObjResponse<T>> get({ int id = 0, Map<String, dynamic> params = const {} });
  Future<ObjResponse> insert({ Map<String, dynamic> params = const {} });
  Future<ObjResponse> update({ Map<String, dynamic> params = const {} });
  Future<ObjResponse> delete({ int id = 0, Map<String, dynamic> params = const {} });
}



