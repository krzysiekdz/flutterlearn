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

abstract class BaseFormWidgetState<T extends BaseFormWidget> extends State<T>  {

  bool isLoading = false;
  bool isError = false;
  String errMsg = '';

  int get tabCount => 1;
  bool get wrapInScrollView => true;

  bool get isAddForm => widget.formArgs.type == FormType.add;
  bool get isEditForm => widget.formArgs.type == FormType.edit;
  int get id => widget.formArgs.data;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _canExitForm,
      child: DefaultTabController(
        length: tabCount,
        child: Scaffold(
          appBar: AppBar(
            title: Text( isAddForm? widget.addTitle : widget.editTitle ),
            bottom: buildTabBar(),
          ),
          body: tabCount < 2 ? wrapForm( buildForm(), wrapInScrollView: wrapInScrollView ) : _buildTabBarView(),
          bottomNavigationBar: buildBottomNav(),
        ),
      ),
    );
  }

  TabBar? buildTabBar() {
    if(tabCount <= 1) return null;
    else {
      return TabBar(
          isScrollable: true,
          tabs: [
            ...createTabs()
          ]
      );
    }
  }

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
    return TabBarView(children: buildForms());
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