import 'package:flutter/cupertino.dart';
import '../../utils/CommonData.dart';

mixin CommonWidget {
  late CommonData commonData;
//  late ThemeHelper themeHelper;//tutaj nawet nie jest potrzebny themeHelper, bo moge go pobrac z Consumera
//  late AppColors colors;

  void commonWidgetUpdate(BuildContext context) {
    commonData = CommonData.of(context);

    //themeHelper = Provider.of<ThemeHelper>(context, listen: true);// powoduje, ze ten obiekt automatycznie nasluchuje tez zmian ThemeHelpera ! - i jesli bedzie zmiana, wywola się build
//    themeHelper = Provider.of<ThemeHelper>(context, listen: false);
//    colors = themeHelper.currentColor;
  }
}