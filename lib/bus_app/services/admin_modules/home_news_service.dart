
import 'package:flutterlearn/bus_app/bus_app.dart';


class HomeNewsService extends AdminModuleService {

  HomeNewsService.fromContext(super.context) : super.fromContext();

  @override
  HomeNewsRepo createRepo() => HomeNewsRepo(apiService: apiService);

}

class HomeNewsRepo extends ApiRepo<News> {
  HomeNewsRepo({required super.apiService}) : super(endpoint: 'home/news');

  @override
  News mapObj(data) => News(data: data);
}