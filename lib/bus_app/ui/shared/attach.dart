import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutterlearn/bus_app/bus_app.dart';
import 'package:image_picker_web/image_picker_web.dart';

class Attachments extends BaseListWidget {

  final AdminState adminState;
  final String table;
  final int itemId;

  Attachments({ super.key, required this.adminState, required this.table, required this.itemId }) :
    super(title: 'Załączniki', deleteConfirm: 'Czy usunąć załącznik?', heroTag: 'Attachments', emptyLabel: 'Brak załączników') ;

  @override
  State<StatefulWidget> createState() => _AttachmentsState();

}

class _AttachmentsState extends BaseListWidgetState<Attachments> {

  @override
  AdminState get adminState => widget.adminState;

  @override
  bool get selfBuild => true;

  @override
  AdminModuleService createService() => AttachmentsService.fromState(adminState);

  List<Image> images = [];

  @override
  void showAddForm() async {
//    Navigator.of(context).push( slideRoute(AdminScheduleForm(formApiArgs: addFormArgs  ))  );
    File? img = await ImagePickerWeb.getImageAsFile();
    if(img != null) {
//      print('got image');
//      setState(() {
//        images.add(img);
//      });
    }
  }

  @override
  void showEditForm(int id) {
//    Navigator.of(context).push( slideRoute( AdminScheduleForm(formApiArgs: editFormArgs(id) ) ) );
  }

  @override
  Map<String, String> getListParams() => {'table' : widget.table, 'item_id' : '${widget.itemId}'};

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(CustomStyles.padding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title!,
                  style: const TextStyle(fontSize: 18),
                ),
                TextButton.icon(onPressed: (){ showAddForm(); }, icon: const Icon(Icons.add), label: const Text(''), ),
              ],
            ),

            gap(),

            buildBody(
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    for( int i = 0; i < (data?.length ?? 0); i++ ) buildItem(context, i),
                    ...(images.map((e) =>  SizedBox(width: 160, height: 160, child: e,)).toList()),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  Widget buildItem(BuildContext context, int i) {
    Attachment item = data?[i] as Attachment;
    return SizedBox(
      width: 160,
      height: 248,
      child: Card(
        child: ListTile(
          onTap: () { showEditForm(item.id); },
          contentPadding: const EdgeInsets.all(4),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20, child: Text('${item.name}.${item.ext}', style: const TextStyle(fontSize: 12),)),

              SizedBox(
                width: double.infinity,
                height: 160,
                child: CachedNetworkImage(
                    imageUrl: item.url,
                    placeholder: (context, url) =>  const SizedBox( width: 50, child: CircularProgressIndicator())
                ),
              ),

              SizedBox( height: 40, child: TextButton.icon(onPressed: (){ canDeleteItem(item.id); }, icon: const Icon(Icons.delete_outline), label: const Text(''))),
            ],
          ),
        ),
      ),
    );
  }
}
