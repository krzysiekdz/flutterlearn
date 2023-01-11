part of bus_admin_home;

class AdminHomeUrgentNewsForm extends StatefulWidget {
  Function(String?) navTo;
  AdminHomeUrgentNewsForm({super.key, required this.navTo});

  @override
  State<StatefulWidget> createState() => _AdminHomeUrgentNewsFormState();
}

class _AdminHomeUrgentNewsFormState extends State<AdminHomeUrgentNewsForm>  {

  bool isLoading = true;
  bool isError = false;

  late HomeNewsService service;
  late Repository repo;

  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();

  late News item;
  late Map<String, String> model;

  @override
  void initState() {
    super.initState();
    service = HomeNewsService.fromContext(context);
    repo = service.createRepo();
    model = {};
    item = News(data: model);

    title.addListener(() { item.title = title.text; });
    content.addListener(() { item.content = content.text; });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Nowe ogłoszenie'),
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(CustomStyles.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
              controller: title,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text('Tytuł')
              ),
            ),

            gap(),

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

            gap(),

            const Text('Widoczność'),
            Switch(
                value: item.visible,
                onChanged: (value){ setState(() {
                  item.visible = value;
                });  }
                ),


            gap(h: 36),
            SizedBox( width: double.infinity, height: 50, child: ElevatedButton(onPressed: (){ _insertItem(); }, child: const Text('Dodaj')))


          ],
        ),
      ),
    );
  }

  Future<void> _insertItem() async {
    setLoading(true);
    await repo.insert(data: model);
    if(!mounted) return;
    widget.navTo(null);
  }

}