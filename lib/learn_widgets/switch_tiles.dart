
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TilesPage extends StatelessWidget {
  TilesPage({Key? key}) : super(key: key);

  final ValueNotifier<int> valueNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    print('build tiles page');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiles'),
      ),
      body:  TilesReplaceProvider(
          listenable: valueNotifier,
          child: const SwitchTiles(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          valueNotifier.value++;
        },
        tooltip: 'Replace',
        child: const Icon(Icons.find_replace),
      ),
    );
  }
}


class TilesReplaceProvider extends InheritedWidget {

  final ValueListenable<int> listenable;

  const TilesReplaceProvider({required Widget child, Key? key, required this.listenable }) : super(child: child, key:key);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static ValueListenable<int>? of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TilesReplaceProvider>()?.listenable;
  }
}

class SwitchTiles extends StatefulWidget {
  const SwitchTiles({Key? key}) : super(key: key);

  @override
  State<SwitchTiles> createState() => _SwitchTilesState();

}

class _SwitchTilesState extends State<SwitchTiles> {

  late final List<Widget> tiles ;
  ValueListenable<int>? listenable;

  int currTab = 0;

  @override
  void initState() {
    super.initState();

    print('switch tiles: init state');

    tiles = <Widget>[
      const Tile2(color: Color(0xffaa0055), name: 'Czerwony', key: ValueKey(1)),
      const Tile2(color: Color(0xff00aa55), name: 'Zielony', key: ValueKey(2)),
    ];
  }

  //podobne do didUpdateWidget, ale dla context; mozna tutaj uzywac BuildContext.of
  //nie mozna tych operacji zrobic w initState
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('switch tiles: did change dependencies');

    listenable?.removeListener(_replaceTiles);
    listenable = TilesReplaceProvider.of(context);
    listenable?.addListener(_replaceTiles);
  }

  void _replaceTiles() {
    print('swtich tiles: replace tiles');

//    setState(() {
//      tiles.add(tiles.removeAt(0));
//    });

      setState(() {
        if(currTab == 0) {
          currTab = 1;
        } else {
          currTab = 0;
        }
      });
  }

  @override
  void didUpdateWidget(SwitchTiles oldWidget) {
    super.didUpdateWidget(oldWidget);
//    if(oldWidget.notify != widget.notify) {
//      oldWidget.notify.removeListener(_replaceTiles);
//      widget.notify.addListener(_replaceTiles);
//    }
  //jest niepotrzebne, bo teraz nie ma powiązania valuelistenable z widgetem
  }

  @override
  void dispose() {
    listenable?.removeListener(_replaceTiles);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildView(context);
  }

//  @override
//  Widget build(BuildContext context) {
//    return ValueListenableBuilder<int>(
//      valueListenable: widget.notify,
//      builder: (context, value, child) {
//        _replaceTiles();
//        return _buildView(context);
//      },
//    );
//  }

  Widget _buildView(BuildContext context) {
    print('switch tiles: _buildView');

    return Container(
        padding: const EdgeInsets.all(12),
        child:  Center(
          child: Column(
            children: [tiles[currTab]], //za kazdym razem utworzy sie nowy stan!
//            children: tiles,
          ),
        )
    );
  }

}

class Tile extends StatelessWidget {
  final Color color;
  final String name;

  const Tile({Key? key, required this.color, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      margin: const EdgeInsets.only(bottom: 12),
      width: 200,
      height: 200,
      child: Center(
          child: Text(name),
      ),
    );
  }
}

class Tile2 extends StatefulWidget {
  final Color color;
  final String name;

  const Tile2({Key? key, required this.color, required this.name}) : super(key: key);

  @override
  State<Tile2> createState() => _Tile2State();
}

class _Tile2State extends State<Tile2> {

  late final Color color;

  @override
  void initState() {
    super.initState();
    print('tile2 : init state');

    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      margin: const EdgeInsets.only(bottom: 12),
      width: 200,
      height: 200,
      child: Center(
        child: Text(widget.name),
      ),
    );
  }
}