part of bus_admin_schedule;

class AdminScheduleFormCities extends StatefulWidget {

  final List<String> cities;

  const AdminScheduleFormCities({super.key,  required this.cities});

  @override
  State<StatefulWidget> createState() => _AdminScheduleFormCitiesState();
}

class _AdminScheduleFormCitiesState extends State<AdminScheduleFormCities> with AutomaticKeepAliveClientMixin {

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
    return ListView.builder(
      itemCount: _cities.length,
      itemBuilder: buildListItem,
      itemExtent: 100,
    );
  }

  Widget buildListItem(BuildContext context, int i) {
    String item = _cities[i];
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(CustomStyles.padding),
        leading: CircleAvatar(child: Text('${i+1}'), backgroundColor: Colors.green, foregroundColor: Colors.white),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item, style: const TextStyle(fontWeight: FontWeight.bold),),
              OutlinedButton(onPressed: (){ canDeleteItem( i ); }, child: Row(
                children: const [
                  Icon(Icons.close),
                  Text('Usuń'),
                ],
              )),
            ]),
      ),
    );
  }

  void canDeleteItem(int i) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(CustomStyles.padding),
        title: const Text('Czy usunąć przystanek?'),
        actions: [
          SizedBox( width: 100, height: 50, child: ElevatedButton(onPressed: (){ _deleteItem(i); Navigator.of(context).pop(); }, child: const Text('Tak'))),
          SizedBox(width: 100, height: 50, child: OutlinedButton(onPressed: (){ Navigator.of(context).pop(); }, child: const Text('Nie'))),
        ],
      );
    });
  }

  void _deleteItem(int i) {
    setState(() {
      _cities.removeAt(i);
    });
  }


}