
import 'package:flutterlearn/bus_app/bus_app.dart';


class OfferService extends AdminModuleService {

  OfferService.fromContext(super.context) : super.fromContext();
  OfferService.fromState(super.adminState) : super.fromState();

  @override
  OfferRepo createRepo() => OfferRepo(apiService: apiService);

}

class OfferRepo extends ApiRepo<Offer> {
  OfferRepo({required super.apiService}) : super(endpoint: 'offer');

  @override
  Offer mapObj(data) => Offer(data: data);
}