part of bus_admin_schedule;

class AdminCitiesList extends StatefulWidget {

  final List<String> cities;

  const AdminCitiesList({super.key,  required this.cities});

  @override
  State<StatefulWidget> createState() => _AdminCitiesListState();
}

class _AdminCitiesListState extends State<AdminCitiesList> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  late List<String> _cities;

  @override
  void initState() {
    super.initState();
    _cities = List.from(widget.cities);
  }

  List<String> get cities => _cities;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cities.length,
              itemBuilder: buildListItem,
              itemExtent: 100,
            ),
          ),
          const SizedBox(height: 70,)
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { actionAdd(); },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildListItem(BuildContext context, int i) {
    String item = _cities[i];
    return Card(
      child: ListTile(
        onTap: () { actionEdit(i); },
        contentPadding: const EdgeInsets.all(CustomStyles.padding),
        leading: CircleAvatar( backgroundColor: Colors.green, foregroundColor: Colors.white, child: Text('${i+1}')),
        title: ListTitleAndDelete(item, actionDelete: () { canDeleteItem(i); })
      ),
    );
  }

  void canDeleteItem(int i) {
    showDialogYesNo(context,
        title: const Text('Czy usunąć przystanek?'),
        actionYes: () { _deleteItem(i); }
    );
  }

  void _deleteItem(int i) {
    setState(() {
      _cities.removeAt(i);
    });
  }

  void actionAdd() async {
    dynamic res = await Navigator.of(context).push(
        slideRoute( AdminCitiesForm(formArgs: FormArgs() ) )
    );

    if(res is String) {
      setState(() {
        _cities.add(res);
      });
    }
  }

  void actionEdit(int i) async {
    dynamic res = await Navigator.of(context).push(
        slideRoute( AdminCitiesForm(formArgs: FormArgs(type: FormType.edit) , city: _cities[i] ) )
    );

    if(res is String) {
      setState(() {
        _cities[i] = res;
      });
    }
  }

}