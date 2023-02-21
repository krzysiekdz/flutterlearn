
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

  String tmpName = '';

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
          setLoading(true);
          JsonResponse res = await service.apiService.sendFile(fileData);
          setLoading(false);
          if(!mounted) return;
          if(res.isSuccess()) {
            tmpName = res.json['tmp_name'];
            print('tmp name = $tmpName');
            //kolejne zapytanie do api aby zapisac zalacznik
            //dodanie zdjecia do listy data[] - wyswietlenie widgetu - albo po prostu odswiezenie? - na latwizne
            //czyli najpierw zapisanie a potem odswiezenie
            //dodac set loading pzy wczytywaniu get html file content
          } else {
            showInfoDialog(context, title: const Text('Nie udało się'));
          }
      });
    });
    input.click();
  }

  //html: pobranie zawartosci pliku jako bajty
  void _getHtmlFileContent(html.File blob, Function(FileData fileData) callback) {
    html.FileReader reader = html.FileReader();
    reader.readAsDataUrl(blob);
    reader.onLoadEnd.listen((e) {
      String res = reader.result.toString();//np: "data:application/pdf;base64,JVBERi0xLjQN..."
      FileData fileData = FileData(
          mimeType: res.split(';')?[0].split(':')?[1] ?? 'text/plain',
          bytes: const Base64Decoder().convert(res.split(',')?[1] ?? ''),
      );
      callback(fileData);
    });
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
