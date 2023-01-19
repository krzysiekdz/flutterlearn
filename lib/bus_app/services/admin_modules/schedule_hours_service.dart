
import 'package:flutterlearn/bus_app/bus_app.dart';


class ScheduleHoursService extends AdminModuleService {

  ScheduleHoursService.fromContext(super.context) : super.fromContext();
  ScheduleHoursService.fromState(super.adminState) : super.fromState();

  @override
  ScheduleHoursRepo createRepo() => ScheduleHoursRepo(apiService: apiService);

}

class ScheduleHoursRepo extends ApiRepo<Schedule> {
  ScheduleHoursRepo({required super.apiService}) : super(endpoint: 'schedule/hours');

  @override
  Schedule mapObj(data) => Schedule(data: data);
}