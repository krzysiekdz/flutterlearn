part of bus_admin_home;

class AdminHomeUrgentNews extends BaseListWidget {

  AdminHomeUrgentNews({super.key}) :
    super(title: 'Ogłoszenia', deleteConfirm: 'Czy usunąć ogłoszenie?') ;

  @override
  State<StatefulWidget> createState() => _AdminHomeUrgentNewsState();
}

class _AdminHomeUrgentNewsState extends BaseListWidgetState<AdminHomeUrgentNews>  {

  @override
  AdminModuleService createService() => HomeNewsService.fromContext(context);

  void showAddForm() {
    Navigator.of(context, rootNavigator: true).push(
        slideRoute( AdminHomeUrgentNewsForm( formApiArgs: addFormArgs) ) );
  }

  void showEditForm(int id) {
    Navigator.of(context, rootNavigator: true).push(
        slideRoute( AdminHomeUrgentNewsForm( formApiArgs: editFormArgs(id)) ) );
  }

  Widget buildListItem(BuildContext context, int i) {
    News item = data?[i] as News;
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
            Text(item.content),
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
