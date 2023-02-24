library bus_admin_offer;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutterlearn/bus_app/bus_app.dart';

part 'admin_offer_form.dart';

class AdminOffer extends BaseListWidget {

  final ScreenSize screenSize;

  AdminOffer({ required this.screenSize, super.key }) :
    super(title: 'Oferty', deleteConfirm: 'Czy usunąć ofertę?', heroTag: 'AdminOffer') ;

  @override
  State<StatefulWidget> createState() => _AdminOfferState();

}

class _AdminOfferState extends BaseListWidgetState<AdminOffer> {

  @override
  AdminModuleService createService() => OfferService.fromContext(context);

  @override
  void showAddForm() {
    Navigator.of(context).push( slideRoute(AdminOfferForm(formApiArgs: addFormArgs  ))  );
  }

  @override
  void showEditForm(int id) {
    Navigator.of(context).push( slideRoute( AdminOfferForm(formApiArgs: editFormArgs(id) ) ) );
  }

  @override
  Widget buildItem(BuildContext context, int i) {
    Offer item = data?[i] as Offer;
    return Card(
      child: ListTile(
        onTap: () { showEditForm(item.id); },
        contentPadding: const EdgeInsets.all(CustomStyles.padding),
        leading:  SizedBox(
          width: 80,
          height: 120,
          child: CachedNetworkImage(
            imageUrl: item.url,
            placeholder: (context, url) =>  const CircularProgressIndicator(),
          ),
        ),
        title: listTitleAndDelete(item.title, actionDelete: () { canDeleteItem(item.id); } ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gap(h:4),
            Text(item.subtitle, style: const TextStyle(color: Colors.grey),),
            gap(h:4),
            Text(item.descr),
            gap(),
            chipVisible(item.visible),
          ],
        ),
      ),
    );
  }
}