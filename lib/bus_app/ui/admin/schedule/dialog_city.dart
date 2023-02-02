part of bus_admin_schedule;

class DialogCity extends BaseFormWidget {
  final String city;
  DialogCity({  required super.formArgs,  this.city = '' }) :
    super( addTitle: 'Nowy przystanek', editTitle: 'Edycja przystanku',);

  @override
  State<StatefulWidget> createState() => _DialogCityState();
}

class _DialogCityState extends BaseFormWidgetState<DialogCity> {

  final city = TextEditingController();

  @override
  void initState() {
    super.initState();

    city.text = widget.city;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(isAddForm ?  widget.addTitle : widget.editTitle),
      content: buildForm(),
      actions: [
          dialogActions(context, btnOk: Text(isAddForm ? 'Dodaj' : 'Zapisz'), btnOkAction: (){ submit(); })
      ],
    );
  }

  @override
  Widget buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        gap(h:24),

        TextField(
          controller: city,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          autofocus: true,
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