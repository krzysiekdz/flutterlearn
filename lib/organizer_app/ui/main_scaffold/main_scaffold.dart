import 'package:flutter/material.dart';
import 'package:flutterlearn/core/types.dart';

import '../app.dart';
import '../calendar/app_bar.dart';
import '../calendar/calendar.dart';
import '../home/app_bar.dart';
import '../home/home.dart';
import '../notes/app_bar.dart';
import '../notes/notes.dart';
import '../todos/app_bar.dart';
import '../todos/todos.dart';

class MainScaffold extends StatefulWidget {
  final FunctionInt setAppView;

  const MainScaffold({Key? key, required this.setAppView}) : super(key: key);

  @override
  State<MainScaffold> createState() => _MainScaffoldState();

}

class _MainScaffoldState extends State<MainScaffold> {
  //to jest stan aplikacji - globalne zmienne które istnieja przez cały cykl życia aplikacji
  late int currTab ;
  late final List<Widget> pages;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    currTab = 0;
    pageController = PageController();
    pages =  <Widget>[
      const Home(),
      const TodosList(),
      const NotesList(),
      const Calendar(),
    ];
  }

  void changePage(int i) {
    setState(() {
      currTab = i;
    });
  }

  /*
  * build app - main scaffold
  * */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zeszycik Pro'),),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavBar(),
      drawer: buildDrawer(context),
    );
  }

  Widget buildBody() {
    return PageView(
      children: pages,
      controller: pageController,
      onPageChanged: changePage,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  PreferredSizeWidget buildAppBar() {
    if(currTab == 1) {  return TodosAppBarBuilder().buildAppBar(); }
    if(currTab == 2) { return NotesAppBarBuilder().buildAppBar(); }
    if(currTab == 3) { return CalendarAppBarBuilder().buildAppBar(); }
    else { return HomeAppBarBuilder().buildAppBar(); }
  }


  BottomNavigationBar buildBottomNavBar() {
    return BottomNavigationBar(
        currentIndex: currTab,
        type: BottomNavigationBarType.fixed,
        onTap: (int i) {
          pageController.jumpToPage(i);//page view po zmianie strony sam wywoła changePage
        } ,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Pulpit'),
          BottomNavigationBarItem(icon: Icon(Icons.today_outlined), label: 'Listy rzeczy'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Notatki'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Kalendarz'),
        ]
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Menu')),
          ListTile(title: Text('Item 1'),),
          ListTile(title: Text('Item 2'),),
          ListTile(title: Text('Item 3'),),
          ListTile(title: Text('Wyloguj się'), onTap: () { widget.setAppView(App.LOGIN_VIEW); },),
        ],
      ),
    );
  }
}