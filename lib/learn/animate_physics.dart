import 'package:flutter/material.dart';
import 'package:flutterlearn/utils/ThemeHelper.dart';
import 'package:provider/provider.dart';



class PhysicsCardDemo extends StatelessWidget {
  const PhysicsCardDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physics demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Consumer<ThemeHelper>(
          builder : (context, themeHelper, child) => DraggableChild(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration:  BoxDecoration(
                border: Border.all(color: themeHelper.currentColor.primary, width: 4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('Hello world'),
            ),
          ),
        ),
      ),
    );
  }
}

class DraggableChild extends StatefulWidget {
  final Widget child;

  const DraggableChild({Key? key, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DraggableChildState();
}

class _DraggableChildState extends State<DraggableChild> with SingleTickerProviderStateMixin {

  late AnimationController animCtrl;
  late Animation anim1;
  late Animation anim2;
  int frameCtr = 0;
  bool isAnimForward = false;

  @override
  void initState() {
    super.initState();
    animCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    anim1 = Tween<double>(begin: 1, end: 150).chain(CurveTween(curve: Curves.elasticIn)).animate(animCtrl);
    anim2 = Tween<Color>(begin: Colors.blue, end: Colors.yellow).animate(animCtrl);
    animCtrl.addListener( onAnimationTick );
  }

  void onAnimationTick() {
    frameCtr++;
    print('frame = $frameCtr');
    setState(() {});
  }

  void runAnim() {
    frameCtr = 0;

    if(!isAnimForward) {
      isAnimForward = true;
      animCtrl.forward();
    }
    else {
      isAnimForward = false;
      animCtrl.reverse();
    }
  }

  @override
  void dispose() {
    animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    print('_DraggableChildState: build()');
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: anim1.value + 100, left: anim1.value + 100),
//            decoration: BoxDecoration(
//              color: anim2.value,
//            ),
            child: GestureDetector(
                onTap: () { runAnim(); },
                child: widget.child
            ),
          ),
        ]
      ),
    );
  }

}