import 'package:flutterlearn/bus_app/bus_app.dart';

enum FormType {
  add, edit
}

class FormArgs {
  FormType type;
  Function refreshParent;
  dynamic data;
  AdminState adminState;

  FormArgs({ this.type = FormType.add, required this.refreshParent, this.data, required this.adminState });
}


abstract class BaseFormWidget extends StatefulWidget {
  FormArgs formArgs;
  final String addTitle;
  final String editTitle;
  BaseFormWidget({super.key, required this.formArgs, this.addTitle = 'Nowy', this.editTitle = 'Edycja'});
}

abstract class BaseFormWidgetState<T extends BaseFormWidget, E extends BaseModel> extends State<T>  {

  bool isLoading = false;
  bool isError = false;

  late AdminModuleService service;
  late Repository repo;

  late E item;
  late Map<String, String> model;

  bool get isAddForm => widget.formArgs.type == FormType.add;
  bool get isEditForm => widget.formArgs.type == FormType.edit;
  int get id => widget.formArgs.data;
  Function get refreshParent => widget.formArgs.refreshParent;
  AdminState get adminState => widget.formArgs.adminState;

  @override
  void initState() {
    super.initState();
    service = createService();
    repo = service.createRepo();
    model = {};
    item = createItem(model);

    if(isAddForm) {
      initAddModel();
      initFormFields();
    }
    else { getItem(); }

  }

  AdminModuleService createService();

  E createItem(Map<String, String> m);

  void initAddModel();

  void initEditModel(E obj);


  Future<void> getItem() async {
    setLoading(true);
    ObjResponse<E> r = await repo.get(id: id) as ObjResponse<E>;
    if(!mounted) return;
    setLoading(false);
    if(r.obj == null) return;
    item['id'] = '$id';
    initEditModel(r.obj!);
    initFormFields();
  }

  void initFormFields();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( isAddForm? widget.addTitle : widget.editTitle ),
      ),
      body: _buildBody(),
    );
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

  Widget _buildBody() {
    Widget page;
    if(isLoading) {
      page = const Center(child: CircularProgressIndicator(),);
    }
    else {
      page = SingleChildScrollView(
          padding: const EdgeInsets.all(CustomStyles.padding),
          child: buildForm(),
      );

    }

    return SafeArea(
        child: page,
    );
  }


  Widget buildForm();


  Future<void> submit() async {
    setLoading(true);
    if(isAddForm) { await repo.insert(data: model); }
    else { await repo.update(data: model); }
    if(!mounted) return;

    afterSubmit();
  }

  void afterSubmit() {
    refreshParent();
  }

}