library page_scaffold;

import 'package:flutterlearn/bus_app/bus_app.dart';

part 'page_scaffold_sm.dart';
part 'page_scaffold_xl.dart';

class PageScaffold extends StatefulWidget {

  final RouteUrl route;
  final Config config = DevConfig();

  PageScaffold({Key? key, required this.route}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PageScaffoldState();

  static PageScaffoldState of(BuildContext context) {
    return context.findAncestorStateOfType<PageScaffoldState>()!;
  }

}

class PageScaffoldState extends State<PageScaffold> {

  bool isLoading = true;
  bool isError = false;

  late ApiService apiService;
  late Config config;
  late PageService pageService;
  late PageRepo pageRepo;
  late PageData? pageData;

  @override
  void initState() {
    super.initState();
    print('PageScaffold : initState()');

    _newState();
  }

  void setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  void setError(bool e) {
    setState(() {
      isError = e;
    });
  }

  Future<void> _newState() async {
    setLoading(true);
    setError(false);

    config = widget.config;
    apiService = ApiService();
    pageService = PageService(apiService: apiService, config: config);
    pageRepo = pageService.pageRepo;

    ObjResponse<PageData> res = await pageRepo.getData();
    if( !mounted ) return;
    setLoading(false);

    if( res.isError() ) { setError(true); }
    else {
      pageData = res.obj;
      print('news: ${pageData?.news}');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('PageScaffold : build()');

    //only PageScaffold need to resolve screen size, all other widgets know it from PageScaffold (the same is for other root Scaffolds)
    ScreenSize size = resolveScreenSize(context);

    Widget page;
    if( isLoading ) { page = const Center(child: CircularProgressIndicator(),); }
    else if( size == ScreenSize.sm) { page = PageScaffoldSM(route: widget.route); }
    else { page = PageScaffoldXL(route: widget.route); }

    return page;
  }
}