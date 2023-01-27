part of bus_admin_schedule;


class AdminHoursForm extends BaseFormApiWidget {
  int? sid;
  AdminHoursForm({super.key, required super.formApiArgs, this.sid}) :
  super(addTitle: 'Nowe godziny', editTitle: 'Edycja godzin');

  @override
  State<StatefulWidget> createState() => _AdminHoursFormState();
}

class _AdminHoursFormState extends BaseFormApiWidgetState<AdminHoursForm, Schedule>  {

  final hoursState = GlobalKey<_AdminHoursFormListState>();
  List<String>? get hours => hoursState.currentState?.hours;

  //LateInitializationError: Field '_cities' has not been initialized.
  String _cities = '';

  @override
  bool get isInitAddFromApi => true;

  @override
  Map<String, String> get initAddParams => {'id': '0', 'sid': '${widget.sid}'};

  @override
  void initState() {
    super.initState();
  }

  List<String> get cities {
    if(item.dir == 0) { return _cities.split(';')..removeLast(); }
    else {
      List<String> res =  _cities.split(';')..removeLast();
      return res.reversed.toList();
    }
  }

  @override
  void initFormFields() {}

  @override
  void disposeFormFields() {}

  @override
  Schedule createItem(Map<String, String> m) => Schedule(data: m);

  @override
  AdminModuleService createService() => ScheduleHoursService.fromState(adminState);

  @override
  void initAddModel([Schedule? obj]) {
    item.dir = 0;
    item.visible = true;
    item.sched_id = widget.sid!;
    _cities = obj?.cities ?? '';
  }

  @override
  void initEditModel(Schedule obj) {
    item.dir = obj.dir;
    item.visible = obj.visible;
    item.hours = obj.hours;
    _cities = obj.cities;
  }

  @override
  void copyModelToFields() {}

  @override
  void beforeSubmit() {
    if(hours != null) {
      item.hours = '${hours!.join(';')};';
    }
  }

  @override
  bool get wrapInScrollView => false;

  @override
  Widget buildForm() {
    return Column(
      children: [
          Padding(
            padding: const EdgeInsets.all(CustomStyles.padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Column(
                  children: [
                    Text('Kierunek : ${item.dir == 0 ? 'Normalny' : 'Powrotny'}' ),
                    Switch(
                        value: item.dir == 1 ? true : false,
                        onChanged: (value){ setState(() {
                          item.dir = value ? 1 : 0;
                        });  }
                    ),
                  ],
                ),

                Column(
                  children: [
                    Text('Widoczność : ${item.visible ? 'Widoczny' : 'Ukryty'}'),
                    Switch(
                        value: item.visible,
                        onChanged: (value){ setState(() {
                          item.visible = value;
                        });  }
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
              child: AdminHoursFormList(
                cities: cities,
                hours: item.hours.split(';')..removeLast(),
              )
          ),
      ],
    );
  }




}