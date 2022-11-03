import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/services/routes/AppRouter.dart';
import 'package:flutterlearn/bus_app/styles/custom_colors.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';

class CPadding extends StatelessWidget {
  final Widget child;
  const CPadding({super.key,  required this.child });

  @override
  Widget build(BuildContext context) =>  Padding(padding: const EdgeInsets.all(CustomStyles.padding), child: child);
}

Widget selectedLink({required String text, required VoidCallback action }) => ElevatedButton.icon(
    onPressed: (){ action(); },
    icon: Text(text),
    label: const Icon(Icons.keyboard_arrow_right)
);

Widget buttonLink({required String text, required VoidCallback action }) => OutlinedButton.icon(
    onPressed: (){ action(); },
    icon: Text(text),
    label: const Icon(Icons.keyboard_arrow_right)
);

Widget link({required String text, required VoidCallback action }) => TextButton.icon(
    onPressed: (){ action(); },
    icon: Text(text),
    label: const Icon(Icons.keyboard_arrow_right)
);

Widget Link({required String text, required String url}) {
  return link(text: text, action: () { AppRouter().setUrl(url); });
}

Widget ButtonLink({required String text, required String url}) {
  return buttonLink(text: text, action: () { AppRouter().setUrl(url); });
}

Widget SelectedLink({required String text, required String url}) {
  return selectedLink(text: text, action: () { AppRouter().setUrl(url); });
}


Widget linePrimary() {
  return Container(
    width: 60,
    height: 4,
    margin: const EdgeInsets.only(top: 12, bottom: 12),
    decoration: const BoxDecoration(
      color: CustomColors.primary,
    ),
  );
}

Widget lineThin({double margin = 12, double width = 100}) {
  return Container(
    width: width,
    height: 1,
    margin: EdgeInsets.only(top: margin, bottom: margin),
    decoration: const BoxDecoration(color: CustomColors.greyLight2,),
  );
}