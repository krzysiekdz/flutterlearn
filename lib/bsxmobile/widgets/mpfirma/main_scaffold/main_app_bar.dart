import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/main_scaffold/main_scaffold.dart';
import 'package:flutterlearn/bsxmobile/widgets/shared/circle_image.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {

  String title;
  String pathAvatar;
  Size _preferredSize;

  MainAppBar({super.key, required this.title, required this.pathAvatar, double height = kToolbarHeight}) :
    _preferredSize = Size.fromHeight(height);

  @override
  Size get preferredSize => _preferredSize;

  @override
  Widget build(BuildContext context) {
    print('MainAppBar: build()');

    return AppBar(
      title: Text(title),
      actions: [

        //button with rounded image
        PopupMenuButton<int>(
            splashRadius: 0,
            tooltip: '',
            offset: const Offset(CustomStyles.padding, 60),
            child: CircleImage(imgAsset: pathAvatar, radius: 26, border: 2),
            onSelected: (result) {
              if(result == 0) { MainScaffold.of(context).gotoLoginInitial(); }
              else if(result == 1) { MainScaffold.of(context).gotoLoginUser(); }
              else if(result == 2) { MainScaffold.of(context).gotoLoginCloud(); }
            },
            itemBuilder: (context)   {
              return [
                _buildPopupItem(value: 0, title: 'Zamknij aplikację', icon: Icons.exit_to_app),
                const PopupMenuDivider(),
                _buildPopupItem(value: 1, title: 'Wyloguj użytkownika', icon: Icons.logout),
                const PopupMenuDivider(),
                _buildPopupItem(value: 2, title: 'Zmień chmurę', icon: Icons.cloud_off),
              ];
            }),

        gap(),

      ],
    );
  }

  PopupMenuItem<int> _buildPopupItem({ required int value, required String title, required IconData icon }) {
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