import 'package:flutterlearn/bsxmobile/models/response.dart';
import 'package:flutterlearn/bsxmobile/services/repository/repository.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutterlearn/bsxmobile/utils/extensions.dart';

class HiveRepository<T> extends Repository<T> {

  Box<T> _box;

  HiveRepository({required super.endpoint}) : _box = Hive.box(endpoint);


  @override
  Future<ObjResponse> insert({ dynamic id, required T data }) async {
    if( !canInsert ) { return ObjResponse.error('Cannot INSERT to this repo'); }
    else {
      if( id != null ) {
        await _box.put(id, data);
        return ObjResponse();
      }
      else {
        int id = await _box.add(data);
        return ObjResponse(obj: id);
      }
    }
  }

  @override
  Future<ObjResponse> update({ dynamic id, required T data }) async {
    if( !canUpdate ) { return ObjResponse.error('Cannot UPDATE to this repo'); }
    if( id == null ) return ObjResponse.error('No "id" parameter');
    if( !_box.containsKey( id ) )  return ObjResponse.error('No object to update');
    return insert(id: id, data: data);
  }

  @override
  Future<ObjResponse<T>> get({dynamic id , Map<String, dynamic> params = const {}}) async {
    if( !canGet ) { return ObjResponse.error('Cannot GET from this repo'); }
    else {
      return ObjResponse(obj: _box.get(id));
    }
  }

  @override
  Future<ObjResponse<List<T>>> list({int start = 0, int limit = 10, Map<String, dynamic> params = const {}}) async {
    if( !canList ) { return ObjResponse.error('Cannot LIST from this repo'); }
    else {
//      Map<dynamic, T> map = _box.toMap().map<dynamic, T>((key, value) =>
//          MapEntry(key, value as T)
//      );
      return ObjResponse(obj: _box.values.toList());
    }
  }

  @override
  Future<ObjResponse> delete({dynamic id , Map<String, dynamic> params = const {}}) async {
    if( !canDelete ) { return ObjResponse.error('Cannot DELETE from this repo'); }
    else {
      await _box.delete(id);
      return ObjResponse();
    }
  }


}


class HiveMapRepo extends HiveRepository<Map<String, String>> {
  HiveMapRepo({required super.endpoint});
}
