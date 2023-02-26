import 'package:flutterlearn/bus_app/bus_app.dart';

class FormApiArgs extends FormArgs {
  Function refreshParent;
  AdminState adminState;

  FormApiArgs({ super.type, required this.refreshParent, super.data, required this.adminState });
}

abstract class BaseFormApiWidget extends BaseFormWidget {
  final FormApiArgs formApiArgs;
  BaseFormApiWidget({super.key, required this.formApiArgs, super.addTitle = 'Nowy', super.editTitle = 'Edycja', }) :
    super(  formArgs: formApiArgs);
}

abstract class BaseFormApiWidgetState<T extends BaseFormApiWidget, E extends BaseModel> extends BaseFormWidgetState<T>  {

  late AdminModuleService service;
  late Repository repo;

  late E item;
  late Map<String, String> model;
  @override
  bool get isDirty => item.isDirty;

  bool get isInitAddFromApi => false;
  Map<String, String> get initAddParams => {};

  Function get refreshParent => widget.formApiArgs.refreshParent;
  AdminState get adminState => widget.formApiArgs.adminState;

  @override
  void initState() {
    super.initState();
    service = createService();
    repo = service.createRepo();
    model = {};
    item = createItem(model);
//    item.streamController!.stream.listen((e) {
//      print('event = ${e[0]}, ${e[1]}');
//      isDirty = true;
//    });

    initFormFields();

    if(isAddForm) {
      if( isInitAddFromApi ) { getItem(getItemForAdd: true); }
      else {
        initAddModel();
        copyModelToFields();
        item.isDirty = false;
      }
    }
    else { getItem(); }

  }

  AdminModuleService createService();

  E createItem(Map<String, String> m);

  void initAddModel([E obj]);

  void initEditModel(E obj);

  void copyModelToFields();

  void initFormFields();

  void disposeFormFields();

  Widget get refreshAction => Tooltip( message: 'Odśwież',
      child: TextButton(onPressed: (){ getItem(); setState((){}); }, child: const Icon(Icons.refresh, color: Colors.white,), )
  );


  Future<void> getItem({bool getItemForAdd = false}) async {
    setLoading(true);
    ObjResponse<E> r ;
    if( getItemForAdd ) { r = await repo.get( params: initAddParams ) as ObjResponse<E>; }
    else { r = await repo.get(id: id) as ObjResponse<E>; }
    if(!mounted) return;

    if(r.code < 0 || r.obj == null) {
      setError(true, r.msg);
      return;
    }

    setLoading(false);
    if( getItemForAdd ) {
      initAddModel(r.obj!);
    } else {
      item['id'] = '$id';
      initEditModel(r.obj!);
    }

    copyModelToFields();
    item.isDirty = false;
  }

  @override
  Future<void> submit() async {
    if(isError) return;

    setLoading(true);
    ObjResponse response;
    beforeSubmit();
    if(isAddForm) { response = await repo.insert(data: model); }
    else { response = await repo.update(data: model); }
    if(!mounted) return;

    afterSubmit(response);
  }

  void beforeSubmit() {}

  void afterSubmit(ObjResponse response) {
    if(response.code < 0) {
      setLoading(false);
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

  @override
  Future<bool> canExitForm() async {
    if( !isDirty ) return true;
    return super.canExitForm();
  }

  @override
  void dispose() {
    disposeFormFields();
    item.dispose();
    super.dispose();
  }

}