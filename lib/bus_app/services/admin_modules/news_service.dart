
import 'package:flutterlearn/bus_app/bus_app.dart';


class NewsService extends AdminModuleService {

  NewsService.fromContext(super.context) : super.fromContext();

  @override
  NewsRepo createRepo() => NewsRepo(apiService: apiService);

}

class NewsRepo extends ApiRepo<News> {
  NewsRepo({required super.apiService}) : super(endpoint: 'news');

  @override
  News mapObj(data) => News(data: data);
}