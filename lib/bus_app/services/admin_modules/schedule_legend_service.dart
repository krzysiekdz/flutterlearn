
import 'package:flutterlearn/bus_app/bus_app.dart';


class ScheduleLegendService extends AdminModuleService {

  ScheduleLegendService.fromContext(super.context) : super.fromContext();
  ScheduleLegendService.fromState(super.adminState) : super.fromState();

  @override
  ScheduleLegendRepo createRepo() => ScheduleLegendRepo(apiService: apiService);

}

class ScheduleLegendRepo extends ApiRepo<ScheduleLegend> {
  ScheduleLegendRepo({required super.apiService}) : super(endpoint: 'schedule/legend');

  @override
  ScheduleLegend mapObj(data) => ScheduleLegend(data: data);
}