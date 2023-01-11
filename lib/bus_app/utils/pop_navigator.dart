import 'package:flutterlearn/bus_app/bus_app.dart';

class PopNavigator extends Navigator {

  Function(String) onPop;
  Function(String) onPush;
  PopNavigator({ required this.onPop, required this.onPush, super.key , super.onGenerateRoute, super.pages, super.onPopPage, });

  @override
  NavigatorState createState() => PopNavigatorState(widget: this);

}

class PopNavigatorState extends NavigatorState {

  PopNavigator widget;
  List<String> _phistory = [];
  PopNavigatorState({ required this.widget });

  @override
  void initState() {
    super.initState();
  }

  @override
  Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments}) {
    _phistory.add(routeName);
    widget.onPush(routeName);
    return super.pushNamed(routeName, arguments:arguments);
  }

  @override
  void pop<T extends Object?>([T? result]) {
    if(_phistory.isNotEmpty) {
      String route = _phistory.removeLast();
      widget.onPop(route);
    }
    super.pop(result);
  }


}