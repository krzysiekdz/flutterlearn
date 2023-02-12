import 'package:flutterlearn/bus_app/bus_app.dart';

enum FormType {
  add, edit
}

class FormArgs {
  FormType type;
  dynamic data;

  FormArgs({ this.type = FormType.add, this.data });
}

abstract class BaseFormWidget extends StatefulWidget {
  FormArgs formArgs;
  final String addTitle;
  final String editTitle;
  BaseFormWidget({super.key, required this.formArgs, this.addTitle = 'Nowy', this.editTitle = 'Edycja'});
}

abstract class BaseFormWidgetState<T extends BaseFormWidget> extends State<T> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  bool isLoading = false;
  bool isError = false;
  String errMsg = '';

  int get tabCount => 1;
  bool get wrapInScrollView => true;

  bool get isAddForm => widget.formArgs.type == FormType.add;
  bool get isEditForm => widget.formArgs.type == FormType.edit;
  int get id => widget.formArgs.data;

  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabCount, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//
//  @override
//  Widget build(BuildContext context) {
//    return WillPopScope(
//      onWillPop: _canExitForm,
//      child: DefaultTabController(
//        length: tabCount,
//        initialIndex: tabBarIndex, //odpowiada za wybrany Tab w TabBar, nie za TabBarView
//        child: Scaffold(
//          appBar: AppBar(
//            title: Text( isAddForm? widget.addTitle : widget.editTitle ),
//            bottom: buildTabBar(),
//          ),
//          body: tabCount < 2 ? wrapForm( buildForm(), wrapInScrollView: wrapInScrollView ) : _buildTabBarView(),
//          bottomNavigationBar: buildBottomNav(),
//        ),
//      ),
//    );
//  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: _canExitForm,
      child: Scaffold(
        appBar: AppBar(
          title: Text( isAddForm? widget.addTitle : widget.editTitle ),
          bottom: buildTabBar(),
        ),
        body: tabCount < 2 ? wrapForm( buildForm(), wrapInScrollView: wrapInScrollView ) : _buildTabBarView(),
        bottomNavigationBar: buildBottomNav(),
      ),
    );
  }

  TabBar? buildTabBar() {
    if(tabCount <= 1) { return null; }
    else {
      return TabBar(
          controller: _tabController,
          isScrollable: true,
//          onTap: (i) { _saveTabBar(i); },
          tabs: createTabs(),
      );
    }
  }

  /*
  void _saveTabBar(int i) {
    final bucket = PageStorage.of(context);
    if(bucket == null) return;

//    bucket.writeState(context, i, identifier: uniq('TabBar'));
    bucket.writeState(context, i.toDouble() );
  }*/

  /*
  int get tabBarIndex {
    final bucket = PageStorage.of(context);
    if(bucket == null) return 0;

//    int? i = bucket.readState(context, identifier: uniq('TabBar'));
    double? i = bucket.readState(context);
    if(i == null) return 0;
    return i.toInt();
  }*/

  /*
  String uniq(String id) {
    PageStorageKey<int>? key = widget.key as PageStorageKey<int>?;
    if(key == null) return id;
    return '${key.value}::$id';
  }*/

  List<Tab> createTabs() { return []; }

  void setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  void setError(bool e, String msg) {
    setState(() {
      isError = e;
      errMsg = msg == '' ? 'Wystąpił błąd' : msg;
    });
  }

  Widget wrapForm(Widget form, { bool wrapInScrollView = true }) {
    Widget page;
    if (isError) {
      page =  Center(child: Text(errMsg , style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),));
    }
    else if(isLoading) {
      page = const Center(child: CircularProgressIndicator(),);
    }
    else if(wrapInScrollView) {
      page = SingleChildScrollView(
        padding: const EdgeInsets.all(CustomStyles.padding),
        child: form,
      );
    }
    else { page = form; }

    return SafeArea(
      child: page,
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
        controller: _tabController,
        children: buildForms()
    );
  }

  List<Widget> buildForms() { return []; }

  Widget buildForm() { return Container(); }

  Widget buildBottomNav() {
    return Padding(
      padding: const EdgeInsets.all(CustomStyles.padding),
      child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(onPressed:  isError||isLoading ? null : (){ submit(); }, child: Text( isAddForm? 'Dodaj' : 'Zapisz' ))),
    );
  }


  Future<void> submit() async { }

  void exitForm() {
    Navigator.of(context).pop();
  }

  Future<bool> _canExitForm() async {
    bool result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Czy na pewno wyjść?'),
            content: const Text('Zmiany nie zostały zapisane.'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 120, height: 50, child: ElevatedButton(onPressed: (){ Navigator.of(context).pop(true); }, child: const Text('Wyjdź'))),
                  SizedBox(width: 120, height: 50, child: OutlinedButton(onPressed: (){ Navigator.of(context).pop(false); }, child: const Text('Nie wychodź'))),
                ],
              )
            ],
          );
        }
    );

    return result;
  }


}