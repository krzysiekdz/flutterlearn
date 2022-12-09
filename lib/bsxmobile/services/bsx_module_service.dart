
import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/models/session.dart';
import 'package:flutterlearn/bsxmobile/services/bsx_api_service.dart';
import 'package:flutterlearn/bsxmobile/services/bsx_repository.dart';
import 'package:flutterlearn/bsxmobile/services/modules/core.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/main.dart';

abstract class BsxModuleService {
  late BsxApiService bsxApi;
  late Session session;
  late CoreService coreService;
  late CoreRepo coreRepo;
  late Config config;

  BsxModuleService({ BuildContext? context }) {
    if(context == null) return;

    MpFirmaState mpState = MpFirma.of(context);

    session = mpState.session;
    bsxApi = mpState.bsxApi;
    config = mpState.config;
    coreService = mpState.coreService;
    coreRepo = mpState.coreRepo;
  }

  BsxRepository createRepo();

}