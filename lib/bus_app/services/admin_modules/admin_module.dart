
import 'package:flutterlearn/bus_app/bus_app.dart';

abstract class AdminModuleService {
  late ApiService apiService;
  late Config config;
  late Session session;

  AdminModuleService({ required this.apiService, required this.config, required this.session });

  AdminModuleService.fromContext(BuildContext context) {
    AdminState adminState = context.findAncestorStateOfType<AdminState>()!;
    apiService = adminState.apiService;
    config = adminState.config;
    session = adminState.session;
  }

  AdminModuleService.fromState(AdminState adminState) {
    apiService = adminState.apiService;
    config = adminState.config;
    session = adminState.session;
  }


  Repository createRepo();
}