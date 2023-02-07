import 'package:flutterlearn/bus_app/bus_app.dart';


class ContactService extends AdminModuleService {

  ContactService.fromContext(super.context) : super.fromContext();
  ContactService.fromState(super.adminState) : super.fromState();

  @override
  ContactRepo createRepo() => ContactRepo(apiService: apiService);

}

class ContactRepo extends ApiRepo<Contact> {
  ContactRepo({required super.apiService}) : super(endpoint: 'contact');

  @override
  Contact mapObj(data) => Contact(data: data);
}