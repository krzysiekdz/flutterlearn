import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/ui/widgets/misc.dart';
import 'package:flutterlearn/core/Functions.dart';
import '../../widgets/header.dart';


class Contact extends WebPage {
  Contact({required super.params});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Header(title: 'Kontakt'),
          gap(),
          CPadding(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Usługi dla ludności', style: header2(),),
              gap(),
              Text('( Przewóz osób )', style: header3n(),),
              gap(),
              Text('Stanisław Gołaś', style:  header3n(),),

              lineThin(margin: 18),

              Text('Bystrz 21', style:  header3n(),),
              gap(),
              Text('12-150 Spychowo', style:  header3n(),),
              gap(),
              Text('woj. Warmińsko - Mazurskie', style:  header3n(),),

              lineThin(margin: 18),

              Text('tel. (+48) 604 281 529', style:  header3(),),
              gap(),
              Text('email: staszek.bus@interia.pl', style:  header3(),),

            ],
          )),

        ],
      ),
    );
  }




}