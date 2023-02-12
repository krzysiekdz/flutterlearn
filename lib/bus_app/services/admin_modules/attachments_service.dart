import 'package:flutterlearn/bus_app/bus_app.dart';


class AttachmentsService extends AdminModuleService {

  AttachmentsService.fromContext(super.context) : super.fromContext();
  AttachmentsService.fromState(super.adminState) : super.fromState();

  @override
  AttachmentsRepo createRepo() => AttachmentsRepo(apiService: apiService);

}

class AttachmentsRepo extends ApiRepo<Attachment> {
  AttachmentsRepo({required super.apiService}) : super(endpoint: 'attachments');

  @override
  Attachment mapObj(data) => Attachment(data: data);
}