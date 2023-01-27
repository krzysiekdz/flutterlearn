part of bus_admin_schedule;

class AdminHoursFormList extends StatefulWidget {

  final List<String> cities;
  final List<String>? hours;

  const AdminHoursFormList({super.key,  required this.cities, this.hours});

  @override
  State<StatefulWidget> createState() => _AdminHoursFormListState();
}

class _AdminHoursFormListState extends State<AdminHoursFormList>  {

  late List<String> _hours;

  @override
  void initState() {
    super.initState();
    _hours = List.from(widget.hours ?? []);

    if( _hours.length < widget.cities.length ) {
      print('hours < cities');
      for(int i = _hours.length; i < widget.cities.length; i++) {
        if( _hours.length <= i ) { _hours.add(''); }
      }
    }
    else if (_hours.length > widget.cities.length) {
      print('hours > cities');
      _hours.removeRange(widget.cities.length, _hours.length);
    }
    else {
      print('hours == cities');
    }


    print('cities = ${widget.cities}, hours = $hours');
  }

  List<String> get hours => _hours;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.cities.length,
      itemBuilder: buildListItem,
    );
  }

  Widget buildListItem(BuildContext context, int i) {
    String city = widget.cities[i];
    String hour = _hours[i];
    return Card(
      child: ListTile(
          onTap: () { actionEdit(i); },
          contentPadding: const EdgeInsets.all(8),
          leading: CircleAvatar( backgroundColor: Colors.green, foregroundColor: Colors.white, child: Text('${i+1}')),
          title: Text(hour == '' ? '?' : hour),
          subtitle: Text(city),
      ),
    );
  }


  void actionEdit(int i) async {
    String hour = _hours[i];
    RegExp re = RegExp(r'([\d]+)[\s]{0,}:[\s]{0,}([\d]+)');
    RegExpMatch? m = re.firstMatch(hour);
    TimeOfDay initialTime;
    if( m != null ) {
      initialTime = TimeOfDay(hour: int.parse(m.group(1)!), minute: int.parse(m.group(2)!));
    } else {
      initialTime = TimeOfDay.now();
    }
    TimeOfDay? newTime = await showTimePicker(
        context: context,
        helpText: 'Wybierz godzinę',
        hourLabelText: 'godz',
        minuteLabelText: 'min',
        initialEntryMode: TimePickerEntryMode.input,
        cancelText: 'Anuluj',
        errorInvalidText: 'Podaj poprawną godzinę',
        confirmText: 'OK',
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true) ,
            child: child!),
        initialTime: initialTime);

    if(newTime != null) {
      setState(() {
        _hours[i] = '${newTime.hour}:${newTime.minute < 10 ? '0${newTime.minute}' : newTime.minute}';
      });
    }
  }

}