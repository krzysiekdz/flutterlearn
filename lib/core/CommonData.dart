
import 'package:flutter/material.dart';

class CommonData extends InheritedWidget {

  CommonData({Key? key, required Widget child}) : super(key: key, child: child) {
    print('CommonData : constructor');
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static CommonData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CommonData>()!;
  }
}
