import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';
import '../styles/CustomColors.dart';

class AppConfig {
  static const String appName = 'Zeszycik Pro';

  //kolor jasny
  static final AppColors style1 = AppColors(
    primary: CustomColors.palette1_2,
    textColor: Colors.black54,
    hintColor: Colors.grey,
    surface: Colors.white,
    barColor: CustomColors.white1,
  );

  //kolor ciemny
  static final AppColors style1Dark = AppColors(
    primary: CustomColors.palette1_1,
    textColor: Colors.white70,
    hintColor: Colors.white70,
    surface: CustomColors.palette1_0,
    barColor: CustomColors.palette1_0_d1,
    isDark: true,
  );
}