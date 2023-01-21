part of bus_admin_schedule;

class AdminCitiesForm extends BaseFormWidget {
  final String city;
  AdminCitiesForm({  required super.formArgs,  this.city = '' }) :
    super( addTitle: 'Nowy przystanek', editTitle: 'Edycja przystanku',);
  @override
  State<StatefulWidget> createState() => _AdminCitiesFormState();
}

class _AdminCitiesFormState extends BaseFormWidgetState<AdminCitiesForm> {

  final city = TextEditingController();

  @override
  void initState() {
    super.initState();

    city.text = widget.city;
  }


  @override
  Widget buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gap(h:24),

        TextField(
          controller: city,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text('Przystanek')
          ),
        ),

      ],
    );
  }

  @override
  Future<void> submit() async {
    Navigator.of(context).pop( city.text );
  }


}