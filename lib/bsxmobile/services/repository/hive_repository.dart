import 'package:flutterlearn/bsxmobile/models/response.dart';
import 'package:flutterlearn/bsxmobile/services/repository/repository.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutterlearn/bsxmobile/utils/extensions.dart';

class HiveRepository<T> extends Repository<T> {

  Box<T> _box;

  HiveRepository({required super.endpoint}) : _box = Hive.box(endpoint);


  @override
  Future<ObjResponse<List<T>>> list({int start = 0, int limit = 10, Map<String, dynamic> params = const {}}) async {
    if( !canList ) { return ObjResponse(code: -1, msg: 'Cannot LIST from this repo'); }
    else {
      Map<dynamic, T> map = _box.toMap();
      return ObjResponse(obj: map.toList() as List<T>);
    }
  }

  @override
  Future<ObjResponse<T>> get({dynamic id , Map<String, dynamic> params = const {}}) async {
    if( !canGet ) { return ObjResponse(code: -1, msg: 'Cannot GET from this repo'); }
    else {
      return ObjResponse(obj: _box.get(id));
    }
  }

  @override
  Future<ObjResponse> insert({ dynamic id, Map<String, dynamic> data = const {}}) async {
    if( !canInsert ) { return ObjResponse(code: -1, msg: 'Cannot INSERT to this repo'); }
    else {
      if( !data.containsKey('value') ) return ObjResponse(code: -1, msg: 'No "value" parameter');
      T v = data['value'];
      if( data.containsKey('key') ) {
        await _box.put(data['key'], v);
        return ObjResponse();
      }
      else {
         int id = await _box.add(v);
         return ObjResponse(obj: id);
      }
    }
  }

  @override
  Future<ObjResponse> update({dynamic id, Map<String, dynamic> data = const {}}) async {
    if( !canUpdate ) { return ObjResponse(code: -1, msg: 'Cannot UPDATE to this repo'); }
    if( !data.containsKey('key') ) return ObjResponse(code: -1, msg: 'No "key" parameter');
    if( !_box.containsKey( data['key'] ) )  return ObjResponse(code: -1, msg: 'Cannot find object to update');
    return insert(data: data);
  }

  @override
  Future<ObjResponse> delete({dynamic id , Map<String, dynamic> params = const {}}) async {
    if( !canDelete ) { return ObjResponse(code: -1, msg: 'Cannot DELETE from this repo'); }
    _box.delete(id);
    return ObjResponse();
  }

}


class HiveMapRepo extends HiveRepository<Map<String, String>> {
  HiveMapRepo({required super.endpoint});
}
