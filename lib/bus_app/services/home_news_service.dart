
import 'package:flutterlearn/bus_app/models/home_news.dart';
import 'package:flutterlearn/bus_app/services/repo/repo.dart';

class HomeNewsService {
  Repo createRepo() {
    return Repo(endPoint: 'home/news', mapItemFn: mapItem);
  }

  HomeNews mapItem(Map<String, dynamic> d) {
    print('map item : $d');
    HomeNews item = HomeNews();
    item.title = d['title'] ?? '';
    item.content = d['content'] ?? '';
    item.id = int.parse(d['id'] ?? '0');
    return item;
  }
}

