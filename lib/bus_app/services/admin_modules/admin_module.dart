
import 'package:flutterlearn/bus_app/bus_app.dart';

abstract class AdminModuleService {
  ApiService apiService;
  Config config;

  AdminModuleService({ required this.apiService, required this.config });

  Repository createRepo();
}