import 'package:flutterlearn/bsxmobile/models/response.dart';
import 'package:flutterlearn/bsxmobile/services/repository/repository.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutterlearn/bsxmobile/utils/extensions.dart';

class HiveRepository<T> extends Repository {

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
  Future<ObjResponse> insert({Map<String, dynamic> params = const {}}) async {
    if( !canInsert ) { return ObjResponse(code: -1, msg: 'Cannot INSERT to this repo'); }
    else {
      if( !params.containsKey('value') ) return ObjResponse(code: -1, msg: 'No "value" parameter');
      T v = params['value'];
      if( params.containsKey('key') ) {
        await _box.put(params['key'], v);
        return ObjResponse();
      }
      else {
         int id = await _box.add(v);
         return ObjResponse(obj: id);
      }
    }
  }

  @override
  Future<ObjResponse> update({Map<String, dynamic> params = const {}}) async {
    if( !canUpdate ) { return ObjResponse(code: -1, msg: 'Cannot UPDATE to this repo'); }
    if( !params.containsKey('key') ) return ObjResponse(code: -1, msg: 'No "key" parameter');
    if( !_box.containsKey( params['key'] ) )  return ObjResponse(code: -1, msg: 'Cannot find object to update');
    return insert(params: params);
  }

  @override
  Future<ObjResponse> delete({dynamic id , Map<String, dynamic> params = const {}}) async {
    if( !canDelete ) { return ObjResponse(code: -1, msg: 'Cannot DELETE from this repo'); }
    _box.delete(id);
    return ObjResponse();
  }


}
