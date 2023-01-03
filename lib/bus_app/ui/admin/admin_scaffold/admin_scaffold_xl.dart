part of bus_admin_main;


class AdminScaffold_XL extends StatelessWidget {

  const AdminScaffold_XL({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('AdminScaffold_XL : build()');


    return Scaffold(
      appBar: AppBar(
        title: Text('AdminScaffold_XL'),
      ),
      body: Text('Admin XL')
    );
  }

}