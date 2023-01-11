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
  Future<ObjResponse<T>> get({id, Map<String, dynamic> params = const {}}) {
    // TODO: implement get
    throw UnimplementedError();
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
  Future<ObjResponse<List<T>>> list({int start = 0, int limit = 10, Map<String, dynamic> params = const {}}) async {
    if( !canList ) { return ObjResponse.error('Cannot LIST from this repo'); }
    else {
      JsonResponse r = await apiService.post(endpoint: '$endpoint/list');
      List<T> data = [];
      if( r.json['rows'] is List ) {
        List rows = r.json['rows'];
        data = rows.map((e) => mapObj(e)).toList();
      }
      return ObjResponse.fromJsonR(response: r, obj: data);
    }

  }

  @override
  Future<ObjResponse> update({id, required Map<String, String> data}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<ObjResponse> delete({id, Map<String, dynamic> params = const {}}) {
    // TODO: implement delete
    throw UnimplementedError();
  }



}