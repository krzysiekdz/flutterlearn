
import 'package:flutterlearn/bus_app/bus_app.dart';


class ScheduleService extends AdminModuleService {

  ScheduleService.fromContext(super.context) : super.fromContext();
  ScheduleService.fromState(super.adminState) : super.fromState();

  @override
  ScheduleRepo createRepo() => ScheduleRepo(apiService: apiService);

}

class ScheduleRepo extends ApiRepo<Schedule> {
  ScheduleRepo({required super.apiService}) : super(endpoint: 'schedule');

  @override
  Schedule mapObj(data) => Schedule(data: data);
}