import 'package:flutterlearn/bus_app/bus_app.dart';

class PageService  {
  ApiService apiService;
  Config config;
  late PageRepo pageRepo;

  PageService({required this.apiService, required this.config}) {
    pageRepo = createRepo();
  }

  PageRepo createRepo() => PageRepo(apiService: apiService);
}


class PageRepo extends ApiRepo {

  PageRepo({required super.apiService}) :
    super(  endpoint: 'page',
            canList: false,
            canGet: false,
            canInsert: false,
            canUpdate: false,
            canDelete: false );

  Future<ObjResponse<PageData>> getData() async {
    JsonResponse r = await apiService.post(endpoint: '$endpoint/data');
    return ObjResponse.fromJsonR(response: r, obj: PageData(data: r.json));
  }

}

class PageData extends BaseModel {
  PageData({ super.data });

  List<News> get news {
    if( data['news'] == null ) { return []; }
    else {
      if( data['news'] is! List ) {  return []; }
      List news = data['news'] as List;
      return news.map((e) => News(data: e)).toList();
    }
  }

  List<News> get homeNews {
    if( data['home'] == null || data['home']['news'] == null ) { return []; }
    else {
      if( data['home']['news'] is! List ) {  return []; }
      List news = data['home']['news'] as List;
      return news.map((e) => News(data: e)).toList();
    }
  }
}
