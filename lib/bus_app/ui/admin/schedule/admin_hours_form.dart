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
  List<String>? get hours => hoursState.currentState?.hours; //zamiast pobierac hours ze state, mozna by aktualizowac dane w funkcji onChanged

  final legendCheckbox = GlobalKey<SelectorCheckboxDialogState<String>>();

  String _cities = '';
  List<ScheduleLegend> _legend = [];

  @override
  bool get isInitAddFromApi => true;

  @override
  Map<String, String> get initAddParams => {'id': '0', 'sid': '${widget.sid}'};

  List<String> get cities {
    if(item.dir == 0) { return _cities.split(';')..removeLast(); }
    else {
      List<String> res =  _cities.split(';')..removeLast();
      return res.reversed.toList();
//      return _cities.split(';')..removeLast()..reversed.toList(); //tak nie mozna
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
    _legend = obj?.legend ?? [];
  }

  @override
  void initEditModel(Schedule obj) {
    item.dir = obj.dir;
    item.visible = obj.visible;
    item.hours = obj.hours;
    item.mark = obj.mark;
    _cities = obj.cities;
    _legend = obj.legend;
  }

  @override
  void copyModelToFields() {}

  @override
  void beforeSubmit() {
    if(hours != null) {item.hours = '${hours!.join(';')};';}
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
              crossAxisAlignment: CrossAxisAlignment.start,
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

                Column(
                  children: [
                    Text(item.markAsList.isEmpty ?  'Brak' : item.markAsList.join('')),
                    gap(),
                    SelectorCheckboxDialog<String>(
                        key: legendCheckbox,
                        title: 'Legenda - wybierz',
                        values: _legend.map((e) => e.mark).toList(),
                        selected: item.markAsList,
                        captions: _legend.map((e) => Text('${e.mark} - ${e.descr}')).toList(),
                        onChanged: (List values) {
                              setState(() {
                                if( values.isNotEmpty )  { item.mark = '${values.join(';')};'; }
                                else { item.mark = ''; }
                              });
                            },
                        child: OutlinedButton(
                          onPressed: (){ legendCheckbox.currentState!.showCheckboxes(); },
                          child: const Text('Legenda'),
                        ),
                    ),
                  ],
                ),


              ],
            ),
          ),

          Expanded(
              child: AdminHoursFormList(
                key: hoursState,
                cities: cities,
                hours: item.hours.split(';')..removeLast(),
              )
          ),
      ],
    );
  }




}