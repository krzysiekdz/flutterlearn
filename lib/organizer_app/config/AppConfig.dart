import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';
import '../styles/CustomColors.dart';

class AppConfig {
  static const String appName = 'Zeszycik Pro';

  //kolor jasny
  static final AppColors style1 = AppColors(
    primary: CustomColors.palette1_2,
    text: Colors.black54,
    hint: Colors.grey,
    surface: Colors.white,
    bar: CustomColors.white1,
  );

  //kolor ciemny
  static final AppColors style1Dark = AppColors(
    primary: CustomColors.palette1_1,
    text: Colors.white70,
    hint: Colors.white70,
    surface: CustomColors.palette1_0,
    bar: CustomColors.palette1_0_d1,
    isDark: true,
  );
}