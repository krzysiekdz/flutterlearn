
import 'package:flutterlearn/bus_app/bus_app.dart';

mixin PageDataWidget {
  late PageData? pageData;

  PageData? getPageData(BuildContext context) {
    PageScaffoldState pstate = PageScaffold.of(context);
    pageData = pstate.pageData;
    return pageData;
  }

  List<News> get news => pageData?.news ?? [];
  List<News> get homeNews => pageData?.homeNews ?? [];
  News? get firstNews {
    if( pageData == null || pageData!.news.isEmpty ) { return null; }
    else { return pageData!.news[0]; }
  }

}