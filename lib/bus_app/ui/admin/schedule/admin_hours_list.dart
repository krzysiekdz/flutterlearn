part of bus_admin_schedule;


class AdminHoursList extends BaseListWidget {
  final AdminState adminState;
  final int id;
  AdminHoursList({ super.key , required this.adminState, required this.id}) :
    super( deleteConfirm: 'Czy usunąć godziny?', heroTag: 'AdminHoursList', emptyLabel: 'Tutaj dodasz godziny dla kursu') ;

  @override
  State<StatefulWidget> createState() => _AdminHoursListState();

}

class _AdminHoursListState extends BaseListWidgetState<AdminHoursList> {

  @override
  void initState() {
    super.initState();
  }

  @override
  AdminModuleService createService() => ScheduleHoursService.fromState(widget.adminState);

  @override
  void showAddForm() {
    Navigator.of(context).push( slideRoute(
        AdminHoursForm( sid: widget.id, formApiArgs: FormApiArgs( adminState: widget.adminState, refreshParent: loadData )))  );
  }

  @override
  void showEditForm(int id) {
    Navigator.of(context).push( slideRoute(
        AdminHoursForm( formApiArgs: FormApiArgs( type: FormType.edit, data: id, adminState: widget.adminState, refreshParent: loadData )))  );
  }

  @override
  Map<String, String> getListParams() => { 'sid' : '${widget.id}' };

  @override
  Widget buildItem(BuildContext context, int i) {
    Schedule item = data?[i] as Schedule;

    List<String> hours = item.hours.split(';')..removeLast();

    String hfirst = hours[0];
    String hlast = hours.last;

    String title = '${item.title} ( $hfirst - $hlast ) ';
    if( item.dir == 1 ) { title = '${item.title_rev} ( $hfirst - $hlast )'; }

    if(item.mark.isNotEmpty) { title = '$title [ ${item.markAsList.join()} ]'; }

    return Card(
      child: ListTile(
        onTap: () { showEditForm(item.id); },
        contentPadding: const EdgeInsets.all(CustomStyles.padding),
        title: listTitleAndDelete(title, color: item.dir == 1 ? Colors.blue : null,  actionDelete: (){ canDeleteItem(item.id); }),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gap(),
            Text(hours.join(' - ')),
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