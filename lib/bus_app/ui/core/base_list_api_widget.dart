import 'package:flutterlearn/bus_app/bus_app.dart';

abstract class BaseListWidget extends StatefulWidget {
  String? title;
  String deleteConfirm;
  String emptyLabel;
  String heroTag;
  BaseListWidget({super.key, this.title, this.deleteConfirm = 'Czy usunąć?', this.heroTag = 'heroTag',
    this.emptyLabel = 'Brak elementów'});
}

abstract class BaseListWidgetState<T extends BaseListWidget> extends State<T> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  bool get selfBuild => false;

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

  Map<String, String> getListParams() { return {}; }

  Future<void> loadData() async {
    setLoading(true);

    ObjResponse<List> res = await repo.list( params: getListParams() );
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

  FormApiArgs get addFormArgs => FormApiArgs( refreshParent: loadData , adminState: adminState);
  FormApiArgs editFormArgs(int id) => FormApiArgs( refreshParent: loadData , data: id, type: FormType.edit, adminState: adminState );


  AdminState get adminState => context.findAncestorStateOfType<AdminState>()!;

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget>? get actions { return []; }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if( selfBuild ) return Container();

    return Scaffold(
      appBar: widget.title != null ?  AppBar(
        title: Text(widget.title!) ,
        actions: actions,
      ) : null,
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        heroTag: widget.heroTag,
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
    else if (data?.isEmpty ?? false) {
      page = Center(
        child: Text(widget.emptyLabel),
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


