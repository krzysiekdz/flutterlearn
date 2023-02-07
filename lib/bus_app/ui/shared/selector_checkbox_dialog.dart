import 'package:flutterlearn/bus_app/bus_app.dart';


class SelectorCheckboxDialog<T> extends StatefulWidget {

  final Widget child;
  final String title;
  final List<T> values;
  final List<T> selected;
  final List<Widget> captions;
  final void Function(List) onChanged;
  const SelectorCheckboxDialog({super.key, required this.child, required this.title, required this.values,
    required this.captions, required this.selected, required this.onChanged});

  @override
  State<StatefulWidget> createState() => SelectorCheckboxDialogState<T>();
}

class SelectorCheckboxDialogState<T> extends State<SelectorCheckboxDialog> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { showCheckboxes(); },
      child: widget.child,
    );
  }

  void showCheckboxes() async {
     dynamic res = await showDialog( context: context,
         builder: (context) =>  _SelectorCheckboxDialog<T>(
           title: widget.title,
           values: widget.values as List<T>,
           selected: widget.selected as List<T>,
           captions: widget.captions,
         ),
     );

     if( res != null ) {
       widget.onChanged(  res as List<T> );
     }
  }

}

class _SelectorCheckboxDialog<T> extends StatefulWidget {

  final String title;
  final List<T> values;
  final List<T> selected;
  final List<Widget> captions;
  const _SelectorCheckboxDialog({super.key, required this.title, required this.values,
    required this.captions, required this.selected});

  @override
  State<StatefulWidget> createState() => _SelectorCheckboxDialogState<T>();
}

class _SelectorCheckboxDialogState<T> extends State<_SelectorCheckboxDialog> {

  late List<T> _selected;

  @override
  void initState() {
    super.initState();
    _selected = List.from(widget.selected);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: _buildContent(),
      actions: [ dialogActions(context, btnOkAction: () { _onSubmit(); }) ],
    );
  }

  Widget _buildContent() {
    return SizedBox(
      width: 350,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [ for(int i = 0; i < widget.values.length; i++) ...[_buildListItem(context, i), gap()]  ]
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int i) {
    T v = widget.values[i];
    Widget c = widget.captions[i];
    bool isChecked = false;
    if( _selected.contains(v) ) { isChecked = true; }

    void toggle() {
      setState(() {
        if(isChecked) { _selected.remove( v ); }
        else { _selected.add( v ); }
      });
    }

    return Card(
      child: ListTile(
        leading: Checkbox(
          value: isChecked,
          onChanged: (val){ toggle(); }
        ),
        title: c,
        onTap: () { toggle(); },
      ),
    );
  }

  void _onSubmit() {
    Navigator.of(context, rootNavigator: true).pop( _selected );
  }
}
