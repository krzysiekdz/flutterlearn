part of bus_admin_schedule;


class AdminScheduleForm extends BaseFormWidget {
  AdminScheduleForm({super.key, required super.formArgs}) :
    super(addTitle: 'Nowy rozkład', editTitle: 'Edycja rozkładu');

  @override
  State<StatefulWidget> createState() => _AdminScheduleFormState();
}

class _AdminScheduleFormState extends BaseFormWidgetState<AdminScheduleForm, Schedule>  {

  final TextEditingController title = TextEditingController();
  final TextEditingController title_rev = TextEditingController();
  final TextEditingController url = TextEditingController();
  final TextEditingController url_rev = TextEditingController();
  final TextEditingController cities = TextEditingController();
  final TextEditingController order = TextEditingController();

  @override
  int get tabCount => 3;

  @override
  List<Tab> createTabs() {
    return const [
      Tab(child: Text('Podstawowe'),),
      Tab(child: Text('Przystanki'),),
      Tab(child: Text('Godziny'),),
    ];
  }

  void initFormFields() {
    title.addListener(() { item.title = title.text; });
    title_rev.addListener(() { item.title_rev = title_rev.text; });
    url.addListener(() { item.url = url.text; });
    url_rev.addListener(() { item.url_rev = url_rev.text; });
    cities.addListener(() { item.cities = cities.text; });
    order.addListener(() {
      try {item.order = int.parse(order.text);}
      catch (e) { item.order = 0; }
    });
  }

  @override
  void disposeFormFields() {
    title.dispose();
    title_rev.dispose();
    url.dispose();
    url_rev.dispose();
    cities.dispose();
    order.dispose();
  }

  @override
  Schedule createItem(Map<String, String> m) => Schedule(data: m);

  @override
  AdminModuleService createService() => ScheduleService.fromState(adminState);

  void initAddModel() {
    item.visible = true;
    item.order = 0;
  }

  void initEditModel(Schedule obj) {
    item.title = obj.title;
    item.title_rev = obj.title_rev;
    item.url = obj.url;
    item.url_rev = obj.url_rev;
    item.cities = obj.cities;
    item.order = obj.order;
    item.visible = obj.visible;
  }

  @override
  void copyModelToFields() {
    title.text = item.title ;
    title_rev.text = item.title_rev ;
    url.text = item.url ;
    url_rev.text = item.url_rev ;
    cities.text = item.cities ;
    order.text = '${item.order}';
  }

  @override
  List<Widget> buildForms() {
    return [
      buildForm(),
      buildForm2(),
      Center(child: Text('tab 3'),),
    ];
  }

  @override
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
              label: Text('Kurs')
          ),
        ),
        gap(h:24),

        TextField(
          controller: title_rev,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text('Kurs powrotny')
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
        gap(h:24),

        TextField(
          controller: url,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text('URL')
          ),
        ),
        gap(h:24),

        TextField(
          controller: url_rev,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text('URL dla kursu powrotnego')
          ),
        ),
        gap(h:24),

      ],
    );
  }


  Widget buildForm2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        gap(h:24),


        TextField(
          controller: cities,
          minLines: 3,
          maxLines: 10,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text('Przystanki')
          ),
        ),
        gap(h:24),


      ],
    );
  }




}