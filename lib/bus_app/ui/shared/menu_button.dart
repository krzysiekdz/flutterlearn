import 'package:flutterlearn/bus_app/bus_app.dart';

class MenuButton extends StatelessWidget {

  final Color color;
  final String caption;
  final IconData iconData;
  final bool fontDark;
  final double width;
  final double height;
  final Function onTap;

  const MenuButton({super.key,  required this.color, required this.caption, required this.iconData, this.fontDark = false,
      this.width = 160, this.height = 160, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width,
      height: height,
      child: Material(
        color: color,
        elevation: 4,
        borderRadius: BorderRadius.circular(CustomStyles.borderRadius),
        child: InkWell(
          splashColor: CustomColors.greyLight2,
          borderRadius: BorderRadius.circular(CustomStyles.borderRadius),
          onTap: () { onTap(); },
          child: Padding(
            padding: const EdgeInsets.all(CustomStyles.padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconData, color: getFontColor(), size: 40,),
                gap(),
                Text(caption, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,
                  style: TextStyle(color: getFontColor()),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getFontColor() {
    return fontDark? Colors.black : Colors.white;
  }

}