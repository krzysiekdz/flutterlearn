import 'package:flutterlearn/bus_app/bus_app.dart';


abstract class ApiRepo<T extends BaseModel> extends Repository<T> {

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

  T mapObj(dynamic data) => data;

  @override
  Future<ObjResponse<T>> get({id, Map<String, String>? params }) async {
    params ??= {};
    if( !canGet ) { return ObjResponse.error('Cannot GET from this repo'); }
    else {
      if(!params.containsKey('id') && id != null ) { params['id'] = '$id'; }
      JsonResponse r = await apiService.post(endpoint: '$endpoint/get', params: params);
      T? item;
      if(  r.isSuccess() &&  r.json['row'] is Map) {
         item = mapObj( r.json['row'] );
      }
      return ObjResponse.fromJsonR(response: r, obj: item);
    }
  }

  @override
  Future<ObjResponse> insert({id, required Map<String, String> data}) async {
    if( !canInsert ) { return ObjResponse.error('Cannot INSERT to this repo'); }
    else {
      JsonResponse r = await apiService.post(endpoint: '$endpoint/create', params: data);
      return ObjResponse.fromJsonR(response: r);
    }
  }

  @override
  Future<ObjResponse<List<T>>> list({int start = 0, int limit = 10, Map<String, String>? params}) async {
    params ??= {};
    if( !canList ) { return ObjResponse.error('Cannot LIST from this repo'); }
    else {
      params['start'] = '$start';
      params['limit'] = '$limit';

      JsonResponse r = await apiService.post(endpoint: '$endpoint/list', params: params);
      List<T> data = [];
      if( r.isSuccess() && r.json['rows'] is List ) {
        List rows = r.json['rows'];
        data = rows.map((e) => mapObj(e)).toList();
      }
      return ObjResponse.fromJsonR(response: r, obj: data);
    }

  }

  @override
  Future<ObjResponse> update({id, required Map<String, String> data}) async {
    if( !canUpdate ) { return ObjResponse.error('Cannot UPDATE to this repo'); }
    else {
      JsonResponse r = await apiService.post(endpoint: '$endpoint/update', params: data);
      return ObjResponse.fromJsonR(response: r);
    }
  }

  @override
  Future<ObjResponse> delete({id, Map<String, String>? params}) async {
    params ??= {};
    if( !canDelete ) { return ObjResponse.error('Cannot DELETE from this repo'); }
    else {
      if(!params.containsKey('id') && id != null ) { params['id'] = '$id'; }
      JsonResponse r = await apiService.post(endpoint: '$endpoint/remove', params: params);
      return ObjResponse.fromJsonR(response: r);
    }
  }



}