import 'package:flutterlearn/bus_app/bus_app.dart';

void showDialogYesNo(BuildContext context, {Widget? title, Widget? content, Widget? btnNo, VoidCallback? actionYes, Widget? btnYes}) {
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(CustomStyles.padding),
      title: title,
      content: content,
      actions: [
        SizedBox( width: 100, height: 50, child: OutlinedButton(onPressed: (){ Navigator.of(context).pop(); }, child: btnNo ?? const Text('Nie'))),
        SizedBox( width: 100, height: 50, child: ElevatedButton(onPressed: (){ if( actionYes != null ) { actionYes(); } Navigator.of(context).pop(); }, child: btnYes ?? const Text('Tak'))),
      ],
    );
  });
}