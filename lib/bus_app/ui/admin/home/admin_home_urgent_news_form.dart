part of bus_admin_home;


class AdminHomeUrgentNewsForm extends StatefulWidget {
  NavToFn navTo;
  FormArgs formArgs;
  AdminHomeUrgentNewsForm({super.key, required this.navTo, required this.formArgs});

  @override
  State<StatefulWidget> createState() => _AdminHomeUrgentNewsFormState();
}

class _AdminHomeUrgentNewsFormState extends State<AdminHomeUrgentNewsForm>  {

  bool isLoading = false;
  bool isError = false;

  late HomeNewsService service;
  late HomeNewsRepo repo;

  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();
  final TextEditingController order = TextEditingController();

  late News item;
  late Map<String, String> model;

  bool get isAddForm => widget.formArgs.type == FormType.add;
  bool get isEditForm => widget.formArgs.type == FormType.edit;
  int get id => widget.formArgs.data;
  Function get refreshParent => widget.formArgs.refreshParent;

  @override
  void initState() {
    super.initState();
    service = HomeNewsService.fromContext(context);
    repo = service.createRepo();
    model = {};
    item = News(data: model);

    if(isAddForm) {
      initAddModel();
      initFields();
    }
    else {
      getItem();
    }

  }

  void initAddModel() {
    item.visible = true;
    item.order = 0;
  }

  void initEditModel(News obj) {
    item.id = id;
    item.title = obj.title;
    item.content = obj.content;
    item.order = obj.order;
    item.visible = obj.visible;
  }


  Future<void> getItem() async {
    setLoading(true);
    ObjResponse<News> r = await repo.get(id: id);
    if(!mounted) return;
    setLoading(false);
    if(r.obj == null) return;
    initEditModel(r.obj!);
    initFields();
  }

  void initFields() {
    title.text = item.title;
    content.text = item.content;
    order.text = '${item.order}';

    title.addListener(() { item.title = title.text; });
    content.addListener(() { item.content = content.text; });
    order.addListener(() {
      try {item.order = int.parse(order.text);}
      catch (e) { item.order = 0; }
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text( isAddForm? 'Nowe ogłoszenie' : 'Edycja ogłoszenia'),
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
      page = _buildForm();
    }

    return SafeArea(child: page);
  }


  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.all(CustomStyles.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          gap(h:24),

          TextField(
            controller: title,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              label: Text('Tytuł')
            ),
          ),

          gap(h:24),

          TextField(
            controller: content,
            minLines: 10,
            maxLines: 100,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
                label: Text('Treść')
            ),
          ),

          gap(h:24),

          const Text('Widoczność'),
          Switch(
              value: item.visible,
              onChanged: (value){ setState(() {
                item.visible = value;
              });  }
              ),

          gap(h:24),

          SizedBox(
            width: 150,
            child: TextField(
              controller: order,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  label: Text('Kolejność')
              ),
            ),
          ),

          gap(h: 36),
          SizedBox( width: double.infinity, height: 50, child: ElevatedButton(onPressed: (){ _action(); }, child: Text( isAddForm? 'Dodaj' : 'Zapisz' )))


        ],
      ),
    );
  }


  Future<void> _action() async {
    setLoading(true);
    if(isAddForm) { await repo.insert(data: model); }
    else { await repo.update(data: model); }
    if(!mounted) return;
    refreshParent();
    widget.navTo(null);
  }

}