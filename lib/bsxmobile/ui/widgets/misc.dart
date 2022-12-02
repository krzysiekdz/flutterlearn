
import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';

Widget CPadding({required Widget child}) {
  return Padding(
      padding: EdgeInsets.all(CustomStyles.padding),
      child: child,
  );
}

Widget Logo(String imgAsset) {
  return Image.asset(imgAsset, width: 140);
}