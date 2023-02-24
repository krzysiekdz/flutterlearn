
import 'dart:convert';
import 'dart:html' as html;
import 'package:cached_network_image/cached_network_image.dart';
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
      showAddHtml();
  }

  //wybieranie zdjecia - wersja na przegladarke
  void showAddHtml() {
    String inputId = 'attach';
    var el = html.querySelector('#$inputId');
    if(el != null) {
      el.remove();
    }

    var input = html.window.document.createElement('input');
    input.setAttribute('type', 'file');
    input.setAttribute('id', inputId);
    html.document.body?.append(input);
    input.onChange.listen((e) {
      var el = e.currentTarget as html.InputElement;
      html.File? f = el.files?[0];
      if(f == null) return;
      _getHtmlFileContent(f, (fileData) async {
          fileData.fileName = f.name;
          setLoading(true, loadingText: 'Wysyłanie pliku...');
          JsonResponse res = await service.apiService.sendFile(fileData);

          if(!mounted) return;
          if(res.isSuccess()) {
            saveAttachment(res.json['tmp_name'], f.name);
          } else {
            setLoading(false);
            showInfoDialog(context, title:  Text(res.msg));
          }
      });
    });
    input.click();
  }

  //html: pobranie zawartosci pliku jako bajty
  void _getHtmlFileContent(html.File blob, Function(FileData fileData) callback) {
    html.FileReader reader = html.FileReader();
    reader.readAsDataUrl(blob);
    setLoading(true, loadingText: 'Wczytywanie pliku...');
    reader.onLoadEnd.listen((e) {
      String res = reader.result.toString();//np: "data:application/pdf;base64,JVBERi0xLjQN..."
      FileData fileData = FileData(
          mimeType: res.split(';')?[0].split(':')?[1] ?? 'text/plain',
          bytes: const Base64Decoder().convert(res.split(',')?[1] ?? ''),
      );
      callback(fileData);
    });
  }

  //zapisanie załącznika, gdy plik został przeslany na serwer - mamy identyfikator pliku
  Future<void> saveAttachment(String tmpName, String fname) async {
    setLoading(true, loadingText: 'Zapisywanie pliku...');
    Attachment item = Attachment(data: <String, String>{});
    item.table = widget.table;
    item.itemId = widget.itemId;
    item.name = fname;
    item['tmp_name'] = tmpName;
    JsonResponse res = await repo.insert(data: item.data as Map<String, String>);

    if(!mounted) return;
    setLoading(false);
    if(res.isSuccess()) {
      loadData();
    }
    else {
      showInfoDialog(context, title: Text(res.msg));
    }
  }

  @override
  void showEditForm(int id) {
    showDialog(
        context: context,
        builder: (context) => AttachmentsUpdateDialog(
            formApiArgs: FormApiArgs( type: FormType.edit, data: id, adminState: adminState, refreshParent: loadData )
        ),
    );
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
                TextButton.icon(
                  onPressed: isLoading? null: (){ showAddForm(); },
                  icon: const Icon(Icons.add),
                  label: const Text(''),
                ),
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
                    placeholder: (context, url) =>    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
                        child: const CircularProgressIndicator()
                    ),
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


/*
 AttachmentsUpdateDialog
*/


class AttachmentsUpdateDialog extends BaseFormApiDialogWidget {

  AttachmentsUpdateDialog({  required super.formApiArgs }) :
    super( editTitle: 'Edycja załącznika' );

  @override
  State<StatefulWidget> createState() => _AttachmentsUpdateDialogState();
}

class _AttachmentsUpdateDialogState extends BaseFormApiDialogWidgetState<AttachmentsUpdateDialog, Attachment> {

  String url = '';

  @override
  Attachment createItem(Map<String, String> m) => Attachment(data: m);

  @override
  AdminModuleService createService() => AttachmentsService.fromState(adminState);

  final TextEditingController name = TextEditingController();
  final TextEditingController order = TextEditingController();

  @override
  void initAddModel([Attachment? obj]) {} //nie uzywane

  @override
  void initEditModel(Attachment obj) {
    item.name = obj.name;
    item.order = obj.order;
    item.visible = obj.visible;
    url = obj.url;
  }

  @override
  void copyModelToFields() {
    name.text = item.name;
    order.text = '${item.order}';
  }

  @override
  void initFormFields() {
    name.addListener(() { item.name = name.text; });
    order.addListener(() {
      try {item.order = int.parse(order.text);}
      catch (e) { item.order = 0; }
    });
  }

  @override
  void disposeFormFields() {
    name.dispose();
    order.dispose();
  }


  @override
  List<Widget> buildFormFields() {
    return  [

      SizedBox(
        width: double.infinity,
        height: 120,
        child: CachedNetworkImage(
          imageUrl: url,
          placeholder: (context, url) =>    Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
              child: const CircularProgressIndicator()
          ),
        ),
      ),

      gap(),
      TextField(
        controller: name,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
            label: Text('Nazwa')
        ),
      ),
      gap(),

      const Text('Widoczność'),
      Switch(
          value: item.visible,
          onChanged: (value){ setState(() {
            item.visible = value;
          });  }
      ),
      gap(),

      SizedBox(
        width: 150,
        child: TextField(
          controller: order,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text('Kolejność')
          ),
        ),
      ),
      gap(),

    ];
  }

}
