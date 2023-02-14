part of bus_admin_schedule;


class AdminLegendList extends BaseListWidget {
  final AdminState adminState;
  AdminLegendList({ super.key , required this.adminState}) :
  super( deleteConfirm: 'Czy usunąć oznaczenie?', heroTag: 'AdminLegendList', emptyLabel: 'Dodaj legendę do Twoich kursów',
    title: 'Legenda') ;

  @override
  State<StatefulWidget> createState() => _AdminLegendListState();

}

class _AdminLegendListState extends BaseListWidgetState<AdminLegendList> {

  @override
  AdminModuleService createService() => ScheduleLegendService.fromState(widget.adminState);

  @override
  Future<void> showAddForm() async {
    showDialog(
        context: context,
        builder: (context) => DialogLegend( formApiArgs: FormApiArgs( adminState: widget.adminState, refreshParent: loadData ))
    );
  }

  @override
  void showEditForm(int id) {
    showDialog(
        context: context,
        builder: (context) => DialogLegend( formApiArgs: FormApiArgs( type: FormType.edit, data: id, adminState: widget.adminState, refreshParent: loadData ))
    );
  }

  @override
  Widget buildItem(BuildContext context, int i) {
    ScheduleLegend item = data?[i] as ScheduleLegend;

    return Card(
      child: ListTile(
        onTap: () { showEditForm(item.id); },
        contentPadding: const EdgeInsets.all(CustomStyles.padding),
        title: ListTitleAndDelete(item.mark, actionDelete: (){ canDeleteItem(item.id); }),
        subtitle: Text(item.descr),
      ),
    );
  }
}