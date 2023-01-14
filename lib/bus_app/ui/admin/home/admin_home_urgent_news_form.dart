part of bus_admin_home;


class AdminHomeUrgentNewsForm extends BaseFormWidget {

  AdminHomeUrgentNewsForm({super.key, required super.formArgs}) :
    super(addTitle: 'Nowe ogłoszenie', editTitle: 'Edycja ogłoszenia');

  @override
  State<StatefulWidget> createState() => _AdminHomeUrgentNewsFormState();
}

class _AdminHomeUrgentNewsFormState extends BaseFormWidgetState<AdminHomeUrgentNewsForm, News>  {

  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();
  final TextEditingController order = TextEditingController();


  @override
  News createItem(Map<String, String> m) => News(data: m);

  @override
  AdminModuleService createService() => HomeNewsService.fromState(adminState);


  @override
  void initAddModel() {
    item.visible = true;
    item.order = 0;
  }

  @override
  void initEditModel(News obj) {
    item.title = obj.title;
    item.content = obj.content;
    item.order = obj.order;
    item.visible = obj.visible;
  }

  @override
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

  @override
  void afterSubmit() {
    super.afterSubmit();
    Navigator.of(context, rootNavigator: true).pop();
//    widget.navTo(null);
  }


  Widget buildForm() {
    return Column(
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
    );
  }



}