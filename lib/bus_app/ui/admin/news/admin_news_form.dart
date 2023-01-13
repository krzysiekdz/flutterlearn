part of bus_admin_news;


class AdminNewsForm extends BaseFormWidget {
  AdminNewsForm({super.key, required super.formArgs}) :
    super(addTitle: 'Nowy artykuł', editTitle: 'Edycja artykułu');

  @override
  State<StatefulWidget> createState() => _AdminNewsFormState();
}

class _AdminNewsFormState extends BaseFormWidgetState<AdminNewsForm, News>  {

  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();
  final TextEditingController order = TextEditingController();


  @override
  News createItem(Map<String, String> m) => News(data: m);

  @override
  AdminModuleService createService() => HomeNewsService.fromState(adminState);

  void initAddModel() {
    item.visible = true;
    item.order = 0;
  }

  void initEditModel(News obj) {
    item.title = obj.title;
    item.content = obj.content;
    item.order = obj.order;
    item.visible = obj.visible;
  }


  void initFormFields() {
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

  Widget buildForm() {
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
          SizedBox( width: double.infinity, height: 50, child: ElevatedButton(onPressed: (){ submit(); }, child: Text( isAddForm? 'Dodaj' : 'Zapisz' )))


        ],
      ),
    );
  }




}