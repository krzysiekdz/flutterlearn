import 'package:flutterlearn/bus_app/bus_app.dart';


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

  @override
  void showAddForm() {
//    Navigator.of(context).push( slideRoute(AdminScheduleForm(formApiArgs: addFormArgs  ))  );
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
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    Widget page;

    if(isLoading) {
      page = const Center(
        child: CircularProgressIndicator(),
      );
    }
    else if (data?.isEmpty ?? false) {
      page = Center(
        child: Text(widget.emptyLabel),
      );
    }
    else {
      page = Column(
        children: [
          for( int i = 0; i < (data?.length ?? 0); i++ ) buildListItem(context, i),
        ],
      );
    }

    return page;

  }

  @override
  Widget buildListItem(BuildContext context, int i) {
    Attachment item = data?[i] as Attachment;
    return Card(
      child: ListTile(
        onTap: () { showEditForm(item.id); },
        contentPadding: const EdgeInsets.all(CustomStyles.padding),
        title: ListTitleAndDelete(item.name, actionDelete: (){ canDeleteItem(item.id); }),
        subtitle: Text(item.url),
        leading: Image.network(item.url),
      ),
    );
  }
}
