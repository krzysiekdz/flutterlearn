part of bus_admin_schedule;

class DialogLegend extends BaseFormApiDialogWidget {

  DialogLegend({  required super.formApiArgs }) :
    super( addTitle: 'Nowe oznaczenie', editTitle: 'Edycja oznaczenia',);

  @override
  State<StatefulWidget> createState() => _DialogLegendState();
}

class _DialogLegendState extends BaseFormApiDialogWidgetState<DialogLegend, ScheduleLegend> {

  @override
  ScheduleLegend createItem(Map<String, String> m) => ScheduleLegend(data: m);

  @override
  AdminModuleService createService() => ScheduleLegendService.fromState(adminState);

  final mark = TextEditingController();
  final descr = TextEditingController();

  @override
  void initAddModel([ScheduleLegend? obj]) {}

  @override
  void initEditModel(ScheduleLegend obj) {
    item.mark = obj.mark;
    item.descr = obj.descr;
  }

  @override
  void copyModelToFields() {
    mark.text = item.mark;
    descr.text = item.descr;
  }

  @override
  void initFormFields() {
    mark.addListener(() {  item.mark = mark.text; });
    descr.addListener(() {  item.descr = descr.text; });
  }

  @override
  void disposeFormFields() {
    mark.dispose();
    descr.dispose();
  }


  @override
  List<Widget> buildFormFields() {
    return  [

        TextField(
          controller: mark,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          autofocus: true,
          decoration: const InputDecoration(
              label: Text('Oznaczenie')
          ),
        ),

        gap(h:24),

        TextField(
          controller: descr,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          minLines: 5,
          maxLines: 5,
          autofocus: true,
          decoration: const InputDecoration(
              label: Text('Opis')
          ),
        ),

      ];
  }


}