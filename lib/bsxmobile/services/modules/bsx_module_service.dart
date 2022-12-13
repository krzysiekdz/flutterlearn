
import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/models/session.dart';
import 'package:flutterlearn/bsxmobile/services/bsx_api_service.dart';
import 'package:flutterlearn/bsxmobile/services/local_storage/local_storage_service.dart';
import '../repository/repository.dart';
import 'package:flutterlearn/bsxmobile/services/modules/core.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/main.dart';

abstract class BsxModuleService {
  late BsxApiService bsxApi;
  late Session session;
  late CoreService coreService;
  late CoreRepo coreRepo;
  late Config config;
  late LocalStorageService localStorage;

  BsxModuleService({ BuildContext? context }) {
    if(context == null) return;

    MpFirmaState mpState = MpFirma.of(context);

    session = mpState.session;
    bsxApi = mpState.bsxApi;
    config = mpState.config;
    localStorage = mpState.localStorage;
    coreService = mpState.coreService;
    coreRepo = mpState.coreRepo;
  }

  Repository createRepo();

}