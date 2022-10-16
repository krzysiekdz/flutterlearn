import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/config/routes.dart';
import 'package:flutterlearn/bus_app/services/routes/AppRouter.dart';
import 'package:flutterlearn/bus_app/styles/custom_colors.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/bus_app/ui/widgets/header.dart';
import 'package:flutterlearn/bus_app/ui/widgets/misc.dart';
import 'package:flutterlearn/core/widgets.dart';

class HomeContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CustomColors.greyLight,
      ),
      padding: const EdgeInsets.all(CustomStyles.padding),
      width: double.infinity,

      child: Column(
        children: [
          Text('Kontakt', style: header4(),),
          gap(),
          Text('tel. (+48) 604 281 529', style:  header4(),),
          gap(),
          Text('email: staszek.bus@interia.pl', style:  header4(),),
          gap(),
          link(text: 'Zobacz więcej', action: (){ AppRouter().setUrl(UrlNames.contact); }),
        ],
      ),
    );
  }
}