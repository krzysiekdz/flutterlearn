library bus_admin_schedule;

import 'package:flutterlearn/bus_app/bus_app.dart';

part 'admin_schedule_form.dart';

class AdminSchedule extends BaseListWidget {

  final ScreenSize screenSize;

  AdminSchedule({ required this.screenSize, super.key }) :
    super(title: 'Rozkłady', deleteConfirm: 'Czy usunąć rozkład?') ;

  @override
  State<StatefulWidget> createState() => _AdminScheduleState();

}

class _AdminScheduleState extends BaseListWidgetState<AdminSchedule> {

  @override
  AdminModuleService createService() => ScheduleService.fromContext(context);

  @override
  void showAddForm() {
    Navigator.of(context).push( slideRoute(AdminScheduleForm(formArgs: addFormArgs  ))  );
  }

  @override
  void showEditForm(int id) {
    Navigator.of(context).push( slideRoute( AdminScheduleForm(formArgs: editFormArgs(id) ) ) );
  }

  @override
  Widget buildListItem(BuildContext context, int i) {
    Schedule item = data?[i] as Schedule;
    List<String> cities = item.cities.split(';')..removeLast();
    return Card(
      child: ListTile(
        onTap: () { showEditForm(item.id); },
        contentPadding: const EdgeInsets.all(CustomStyles.padding),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold),),
              OutlinedButton(onPressed: (){ canDeleteItem(item.id); }, child: Row(
                children: const [
                  Icon(Icons.close),
                  Text('Usuń'),
                ],
              )),
            ]),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gap(),
            Text(cities.join(' - ')),
            gap(),
            Chip(
              label: Text( item.visible ? 'Widoczny' : 'Niewidoczny', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), ),
              backgroundColor: item.visible ?  Colors.green : Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}