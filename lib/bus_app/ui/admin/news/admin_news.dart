library bus_admin_news;

import 'package:flutterlearn/bus_app/bus_app.dart';

part 'admin_news_form.dart';

class AdminNews extends BaseListWidget {

  final ScreenSize screenSize;

  AdminNews({ required this.screenSize, super.key }) :
    super(title: 'Aktualności', deleteConfirm: 'Czy usunąć artykuł?') ;

  @override
  State<StatefulWidget> createState() => _AdminNewsState();

}

class _AdminNewsState extends BaseListWidgetState<AdminNews> {

  @override
  AdminModuleService createService() => NewsService.fromContext(context);

  @override
  void showAddForm() {
    Navigator.of(context).push( slideRoute(AdminNewsForm(formApiArgs: addFormArgs  ))  );
  }

  @override
  void showEditForm(int id) {
    Navigator.of(context).push( slideRoute( AdminNewsForm(formApiArgs: editFormArgs(id) ) ) );
  }

  @override
  Widget buildItem(BuildContext context, int i) {
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