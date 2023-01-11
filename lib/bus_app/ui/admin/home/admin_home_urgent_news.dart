part of bus_admin_home;

class AdminHomeUrgentNews extends StatefulWidget {

  Function(String?) navTo;
  AdminHomeUrgentNews({super.key, required this.navTo});

  @override
  State<StatefulWidget> createState() => _AdminHomeUrgentNewsState();
}

class _AdminHomeUrgentNewsState extends State<AdminHomeUrgentNews>  {

  bool isLoading = true;
  bool isError = false;

  late HomeNewsService service;
  late Repository repo;
  late List? data;

  @override
  void initState() {
    super.initState();
    service = HomeNewsService.fromContext(context);
    repo = service.createRepo();
    loadData();
  }

  Future<void> loadData() async {
    setLoading(true);

    ObjResponse<List> res = await repo.list();
    if(!mounted) return;
    data = res.obj;

    setLoading(false);
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

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ogłoszenia'),
        ),
        body: _buildBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){  _showAddForm(); },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
    );
  }

  void _showAddForm() {
    widget.navTo( _.newsForm.name );
  }

  Widget _buildBody() {
    Widget page;

    if(isLoading) {
      page = const Center(
        child: CircularProgressIndicator(),
      );
    }
    else {
      page = ListView.builder(
          itemCount: data?.length,
          itemBuilder: _buildListItem,
      );
    }

    return page;
  }

  Widget _buildListItem(BuildContext context, int i) {
    News item = data?[i] as News;
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(CustomStyles.padding),
        title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gap(),
            Text(item.content),
            gap(),
            Chip(
              label: Text( item.visible ? 'Widoczny' : 'Niewidoczny', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), ),
              backgroundColor: item.visible ?  Colors.green : Colors.grey,
            )
          ],
        ),
      ),
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