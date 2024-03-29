part of bus_admin_home;

class AdminHomeSlider extends StatefulWidget {
  const AdminHomeSlider({super.key});

  @override
  State<StatefulWidget> createState() => _AdminHomeSliderState();
}

class _AdminHomeSliderState extends State<AdminHomeSlider>   {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slajdy'),
      ),
      body: const Center(
        child: Text(''),
      )
    );
  }
}

//
//class AdminHome extends StatefulWidget {
//
//  final ScreenSize screenSize;
//
//  const AdminHome({required this.screenSize, super.key});
//
//@override
//State<StatefulWidget> createState() => _AdminHomeState();
//}
//
////zrobic jako klasa ListController
//class _AdminHomeState extends State<AdminHome> {
//
//  late final HomeNewsService service;
//  late final Repo repo;
//  late List<dynamic> data;
//  late Response res;
//  bool isLoading = true;
//
//  @override
//  void initState() {
//    super.initState();
//    print('AdminHome: initState()');
//
//    service = HomeNewsService();
//    repo = service.createRepo();
//    fetchData();
//    print('init state end');
//  }
//
//  void fetchData() async {
//    print('fetch data');
//    setState(() {
//      isLoading = true;
//    });
//    res = await repo.list();
//
//    if(!mounted) return;
//
//    data = res.data  ?? [];
//    print('fetch end');
//    setState(() {
//      isLoading = false;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    print('AdminHome: build()');
//
//    Widget page;
//
//    if(isLoading) {
//      //dodac rozroznienie, czy jest isLoading & data.lenth == 0 czy dociagamy kolejne dane
//      page = const Center(child: CircularProgressIndicator(),);
//    }
//    else if(res.isError()) {
//      print('AdminHome error ${res.msg}');
//      page = _showInfo(context, res.msg);
//    }
//    else {
//      if(data.length == 0) {
//        page = _showInfo(context, 'Brak elementów');
//      }
//      else {
//        page = _buildList(context);
//      }
//    }
//    return page;
//
//  }
//
//  Widget _buildList(BuildContext context) {
//    return ListView.builder(
//        itemCount: data.length,
//        itemExtent: 100,
//        itemBuilder: (context, i) {
//          print('ListTile $i');
//          HomeNews item = data[i];
//
//          return Card(
//              child: ListTile(
//                leading: CircleAvatar(child: Text('${item.id}'),),
//                title: Text(item.title),
//                subtitle: Text(item.content),
//              )
//          );
//        }
//    );
//  }
//
//  Widget _showInfo(BuildContext context, String msg) {
//    return Center(child: Text(msg),);
//  }
//}