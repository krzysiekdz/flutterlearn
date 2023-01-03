library bus_admin_main;

import 'package:flutterlearn/bus_app/bus_app.dart';

part 'admin_scaffold_sm.dart';
part 'admin_scaffold_xl.dart';


class AdminMain extends StatefulWidget {

  final Config config = DevConfig();

  AdminMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AdminState();

  static AdminState of(BuildContext context) => context.findAncestorStateOfType<AdminState>()!;
}

class AdminState extends State<AdminMain> {

  bool isLoading = true;
  bool isError = false;

  late ApiService apiService;
  late Config config;
  late Session session;

  @override
  void initState() {
    super.initState();
    print('AdminMain: initState()');
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
    config = widget.config;
    apiService = ApiService();
    session = Session();
  }

  @override
  Widget build(BuildContext context) {
    print('AdminMain : build()');

    ScreenSize size = resolveScreenSize(context);

    Widget page;

    page = AdminScaffold_SM();
//    if( size == ScreenSize.sm) { page = AdminScaffold_SM(); }
//    else { page = AdminScaffold_XL(); }

    return page;
  }
}