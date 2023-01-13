import 'package:flutterlearn/bus_app/bus_app.dart';

abstract class BaseListWidget extends StatefulWidget {
  String title;
  String deleteConfirm;
  BaseListWidget({super.key, this.title = 'Title', this.deleteConfirm = 'Czy usunąć?'});
}

abstract class BaseListWidgetState<T extends BaseListWidget> extends State<T>  {

  bool isLoading = true;
  bool isError = false;

  late AdminModuleService service;
  late Repository repo;
  late List? data;

  @override
  void initState() {
    super.initState();
    service = createService();
    repo = service.createRepo();
    loadData();
  }

  AdminModuleService createService();

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
        title: Text(widget.title),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){  showAddForm(); },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  void showAddForm();

  void showEditForm(int id);


  void canDeleteItem(int id) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(CustomStyles.padding),
        title: Text(widget.deleteConfirm),
        actions: [
          SizedBox( width: 100, height: 50, child: ElevatedButton(onPressed: (){ _deleteItem(id); Navigator.of(context).pop(); }, child: Text('Tak'))),
          SizedBox(width: 100, height: 50, child: OutlinedButton(onPressed: (){ Navigator.of(context).pop(); }, child: Text('Nie'))),
        ],
      );
    });
  }

  void _deleteItem(int id) async {
    await repo.delete(id: id);
    loadData();
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
        itemBuilder: buildListItem,
      );
    }

    return page;
  }

  Widget buildListItem(BuildContext context, int i);

}


