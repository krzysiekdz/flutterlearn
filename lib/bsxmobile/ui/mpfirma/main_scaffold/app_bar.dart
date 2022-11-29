import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/styles/colors.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/main_scaffold/main_scaffold.dart';

class MainAppBar  {
//chyba zrobic to jako dziedziczaca klase a app bar i wtedy parametry przekazac do konstruktora super

  static AppBar build({required BuildContext context, required String title, required String pathAvatar}) {
    return AppBar(
      leading: const Icon(Icons.menu),
      title:  Text(title),
      actions: [

        //button with rounded image
        PopupMenuButton<int>(
            splashRadius: 0,
            tooltip: '',
            offset: const Offset(CustomStyles.padding, 60),
            child: CircleAvatar(
              radius: 26,
              backgroundColor: CustomColors.greyLight200,
              child: CircleAvatar(
                radius: 24,
                backgroundImage: Image.asset(pathAvatar, fit: BoxFit.fill,).image,
              ),
            ),
            onSelected: (result) {
              if(result == 0) { MainScaffold.of(context).gotoLoginInitial(); }
              else if(result == 1) { MainScaffold.of(context).gotoLoginUser(); }
              else if(result == 2) { MainScaffold.of(context).gotoLoginCloud(); }

            },
            itemBuilder: (context)   {
              return [
                buildPopupItem(value: 0, title: 'Zamknij aplikację', icon: Icons.exit_to_app),
                const PopupMenuDivider(),
                buildPopupItem(value: 1, title: 'Wyloguj użytkownika', icon: Icons.logout),
                const PopupMenuDivider(),
                buildPopupItem(value: 2, title: 'Zmień chmurę', icon: Icons.cloud_off),
              ];
            }),
        gap(),
      ],

    );

  }

  static PopupMenuItem<int> buildPopupItem({ required int value, required String title, required IconData icon }) {
    return PopupMenuItem(
      value: value,
      padding: const EdgeInsets.all(CustomStyles.smPadding),
      child: Row(
        children: [
          Icon(icon),
          gap(),
          Text(title)
        ],
      ),
    );
  }
}