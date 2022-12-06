
import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/models/menu_data.dart';
import 'package:flutterlearn/bsxmobile/styles/colors.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/main_scaffold/main_scaffold.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/users/user_profile.dart';
import 'package:flutterlearn/bsxmobile/widgets/shared/circle_image.dart';
import 'package:flutterlearn/bsxmobile/widgets/shared/misc.dart';
import 'package:flutterlearn/bsxmobile/widgets/shared/pill.dart';
import 'package:flutterlearn/bsxmobile/utils/misc.dart';

class MainDrawer extends StatelessWidget {

  Config config;
  late List<MenuData> menuItems;

  MainDrawer({required this.config});

  @override
  Widget build(BuildContext context) {
    menuItems = config.bottomNav;

    return Drawer(
      child: SafeArea(
        child: ListView(
          children:  [

            ListTile(
              leading: Image.asset(config.pathLogo, width: 40,),
              title: Text(config.appName, style: header4()),
              subtitle: Text(config.versionName),
              tileColor: Colors.transparent,
            ),

            const Divider(),

            CPadding(
              child: Column(
                children: [
                  Text('Nazwa firmy'),
                  gap(h:8),
                  CircleImage(imgAsset: config.pathAvatar, radius: 48, border: 2),
                  gap(h:8),
                  Text('Użytkownik', style: header3()),
                  gap(h:8),
                  Pill(child: Text('Administrator'), color: CustomColors.greyDark55),
                ],
              ),
            ),

            _buildItemProfile(context),

            ..._buildMenuItems(context)

          ],
        ),
      ),
    );
  }

  Widget _buildItemProfile(BuildContext context) {
    return _menuItem(Icons.account_circle, 'Profil', () {
      Navigator.of(context, rootNavigator: true).push(slideRoute( UserProfile(config: config) ));
      Navigator.of(context).pop();
    });
  }

  List<Widget> _buildMenuItems(BuildContext context) {
    List<Widget> items = [];

    menuItems.asMap().forEach((i, e) {
      items.add(
         _menuItem(e.icon, e.caption, () {
           MainScaffold.of(context).onTapNav(i);
           Navigator.of(context).pop();
         })
      );
    });

    return items;
  }

  Widget _menuItem(IconData icon, String caption, VoidCallback action) {
    return   Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(caption),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CustomStyles.borderRadius)
        ),
        onTap: () { action(); },
      ),
    );
  }

}