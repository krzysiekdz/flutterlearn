library bus_page_news;

import 'package:flutterlearn/bus_app/bus_app.dart';


class NewsPage extends WebPage with PageDataWidget {
  NewsPage({super.key, required super.params});


  @override
  Widget build(BuildContext context) {
    init(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          const Header(title: 'Aktualności'),
          ...news.map((e) => NewsItem(title: e.title, content: e.content)).toList(),
        ],
      ),
    );
  }
}

class NewsItem extends StatelessWidget {

  final String title;
  final String content;

  const NewsItem({super.key,  required this.title, required this.content });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CustomStyles.padding),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: header2()),
          gap(),
          Text(content, style:  const TextStyle(fontSize: CustomStyles.fsNormal) ),
          gap(h:32),
          lineThin(width: double.infinity),
        ],
      ),
    );
  }

}