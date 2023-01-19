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
  String errMsg = '';

  late AdminModuleService service;
  late Repository repo;

  late E item;
  late Map<String, String> model;

  int get tabCount => 1;

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

    initFormFields();

    if(isAddForm) {
      initAddModel();
      copyModelToFields();
    }
    else { getItem(); }

  }

  AdminModuleService createService();

  E createItem(Map<String, String> m);

  void initAddModel();

  void initEditModel(E obj);

  void copyModelToFields();

  void initFormFields();

  void disposeFormFields();


  Future<void> getItem() async {
    setLoading(true);
    ObjResponse<E> r = await repo.get(id: id) as ObjResponse<E>;
    if(!mounted) return;

    if(r.code < 0 || r.obj == null) {
      setError(true, r.msg);
      return;
    }

    setLoading(false);
    item['id'] = '$id';
    initEditModel(r.obj!);
    copyModelToFields();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _canExitForm,
      child: DefaultTabController(
        length: tabCount,
        child: Scaffold(
          appBar: AppBar(
            title: Text( isAddForm? widget.addTitle : widget.editTitle ),
            bottom: buildTabBar(),
          ),
          body: tabCount < 2 ? _wrapForm( buildForm() ) : _buildTabBarView(),
          bottomNavigationBar: buildBottomNav(),
        ),
      ),
    );
  }

  TabBar? buildTabBar() {
    if(tabCount <= 1) return null;
    else {
      return TabBar(
        isScrollable: true,
        tabs: [
          ...createTabs()
        ]
      );
    }
  }

  List<Tab> createTabs() { return []; }

  void setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  void setError(bool e, String msg) {
    setState(() {
      isError = e;
      errMsg = msg == '' ? 'Wystąpił błąd' : msg;
    });
  }

  Widget _wrapForm(Widget form) {
    Widget page;
    if (isError) {
      page =  Center(child: Text(errMsg , style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),));
    }
    else if(isLoading) {
      page = const Center(child: CircularProgressIndicator(),);
    }
    else {
      page = SingleChildScrollView(
          padding: const EdgeInsets.all(CustomStyles.padding),
          child: form,
      );

    }

    return SafeArea(
        child: page,
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(children: buildForms().map((e) => _wrapForm(e)).toList());
  }

  List<Widget> buildForms() { return []; }

  Widget buildForm();

  Widget buildBottomNav() {
    return Padding(
      padding: const EdgeInsets.all(CustomStyles.padding),
      child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(onPressed:  isError? null : (){ submit(); }, child: Text( isAddForm? 'Dodaj' : 'Zapisz' ))),
    );
  }


  Future<void> submit() async {
    if(isError) return;

    setLoading(true);
    ObjResponse response;
    if(isAddForm) { response = await repo.insert(data: model); }
    else { response = await repo.update(data: model); }
    if(!mounted) return;

    setLoading(false);

    afterSubmit(response);
  }

  void afterSubmit(ObjResponse response) {
    if(response.code < 0) {
      showDialog(context: context, builder: (context) =>
          AlertDialog(
            contentPadding: const EdgeInsets.all(CustomStyles.padding),
            title: const Text('Błąd'),
            content: Text(response.msg),
            actions: [
              SizedBox(width: double.infinity, height: 50, child: OutlinedButton(onPressed: (){ Navigator.of(context).pop(); }, child: const Text('OK'))),
            ]
        )
      );
    }
    else {
      refreshParent();
      exitForm();
    }
  }

  void exitForm() {
    Navigator.of(context).pop();
  }

  Future<bool> _canExitForm() async {
    bool result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Czy na pewno wyjść?'),
            content: const Text('Zmiany nie zostały zapisane.'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 120, height: 50, child: OutlinedButton(onPressed: (){ Navigator.of(context).pop(false); }, child: const Text('Nie wychodź'))),
                  SizedBox(width: 120, height: 50, child: ElevatedButton(onPressed: (){ Navigator.of(context).pop(true); }, child: const Text('Wyjdź'))),
                ],
              )
            ],
          );
        }
    );

    return result;
  }


  @override
  void dispose() {
    disposeFormFields();
    super.dispose();
  }

}