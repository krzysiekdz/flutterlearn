import 'package:flutterlearn/bus_app/bus_app.dart';

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


Widget ListTitleAndDelete(String title, { required VoidCallback actionDelete, Color? color }) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color),),
        OutlinedButton(onPressed: (){ actionDelete(); }, child: Row(
          children: const [
            Icon(Icons.close),
            Text('Usuń'),
          ],
        )),
      ]);
}

Widget dialogActions(BuildContext context, {VoidCallback? btnOkAction, VoidCallback? btnCancelAction,
    Widget btnOk = const Text('OK'), Widget btnCancel = const Text('Anuluj')}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      SizedBox(
          width: 120,
          height: 50,
          child: ElevatedButton(
              onPressed: btnOkAction == null ? null: (){ btnOkAction!.call(); },
              child:  btnOk
          )
      ),

      SizedBox(
          width: 120,
          height: 50,
          child: OutlinedButton(
              onPressed: (){
                if( btnCancelAction == null ) { Navigator.of(context).pop(); }
                else { btnCancelAction(); }
              },
          child: btnCancel
          )
      ),

    ],
  );
}



