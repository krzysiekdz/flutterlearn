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


  Function get refreshParent => widget.formApiArgs.refreshParent;
  AdminState get adminState => widget.formApiArgs.adminState;

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
  void dispose() {
    disposeFormFields();
    super.dispose();
  }

}