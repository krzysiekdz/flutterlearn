library bus_admin_schedule;

import 'package:flutterlearn/bus_app/bus_app.dart';

part 'admin_schedule_form.dart';
part 'admin_cities_list.dart';
part 'admin_cities_form.dart';
part 'admin_hours_list.dart';
part 'admin_hours_form.dart';
part 'admin_hours_form_list.dart';
part 'city_dialog.dart';
part 'legend_list.dart';
part 'legend_dialog.dart';

class AdminSchedule extends BaseListWidget {

  final ScreenSize screenSize;

  AdminSchedule({ required this.screenSize, super.key }) :
    super(title: 'Rozkłady', deleteConfirm: 'Czy usunąć rozkład?', heroTag: 'AdminSchedule') ;

  @override
  State<StatefulWidget> createState() => _AdminScheduleState();

}

class _AdminScheduleState extends BaseListWidgetState<AdminSchedule> {

  @override
  AdminModuleService createService() => ScheduleService.fromContext(context);

  @override
  void showAddForm() {
    Navigator.of(context).push( slideRoute(AdminScheduleForm(formApiArgs: addFormArgs  ))  );
  }

  @override
  void showEditForm(int id) {
    Navigator.of(context).push( slideRoute( AdminScheduleForm(formApiArgs: editFormArgs(id) ) ) );
  }

  void showLegendList() {
    Navigator.of(context).push( slideRoute(AdminLegendList( adminState:  adminState,))  );
  }

  @override
  List<Widget> get actions => [
    TextButton(onPressed: (){ showLegendList(); }, child: const Text('LEGENDA', style: TextStyle(color: Colors.white),)),
    ...super.actions,
//    PopupMenuButton<int>(
//        icon: const Icon(Icons.more_vert),
//        onSelected: (value) {
//          print('selected = $value');
//        },
//        itemBuilder: (context) => const [
//          PopupMenuItem(value: 0, child: Text('Legenda'), ),
////          PopupMenuDivider(),
//        ],
//    ),
  ];

  @override
  Widget buildItem(BuildContext context, int i) {
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
