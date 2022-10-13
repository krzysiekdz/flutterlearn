import 'package:flutter/material.dart';

class CSlider extends StatefulWidget {

  final List<Widget> items;
  final double height;
  final CSliderIndicatorBuilder? indicatorBuilder;

  const CSlider({super.key, required this.items, this.height = 200, this.indicatorBuilder});

  @override
  State<StatefulWidget> createState() => _CSliderState();

}

typedef CSliderIndicatorBuilder = Widget Function (BuildContext context, double position, int length);


class _CSliderState extends State<CSlider> {

  late final PageController controller;
  double currPageValue = 0;

  @override
  void initState() {
    super.initState();

    controller = PageController();
    controller.addListener(() {
      setState(() {
        currPageValue = controller.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    print('Slider: build() , currPage = $currPageValue');
    double r = currPageValue - currPageValue.floor();

    return Column(
      children: [

        Container(
          height: widget.height,
//          decoration: blackBorder(),
          child: Stack(
            children: [
              PageView.builder(
                pageSnapping: true,
                physics: const BouncingScrollPhysics(),
                controller: controller,
                itemCount: widget.items.length,
                itemBuilder: (context, i) {
                  if( i == currPageValue.floor() ) {
                    return Transform.scale(scale: 1 - r , child: widget.items[i] );
                  }
                  else if ( i == currPageValue.floor() + 1) {
                    return Transform.scale(scale: r , child: widget.items[i] );
                  }
                  else {
                    return Transform.scale(//this transform do nothing, but when all children are transform widgets, then we do not loose state of widget.item[i]
                        scale: 1,
                        child: widget.items[i]
                    );
                  }
                },
              ),

              if( currPageValue >= 0.5 ) Align(
                alignment: Alignment.centerLeft,
                child: Transform.scale(
                  scale: (){ if(r > 0 && currPageValue <= 1) { return r; } else {return 1.0;} }(),
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1), shape: BoxShape.circle),
                        child: IconButton(onPressed: (){ back(); }, icon: const Icon(Icons.keyboard_arrow_left, color: Colors.grey,))
                    ),
                  ),
                ),
              ),

              if( currPageValue < widget.items.length-1.5 ) Align(
                alignment: Alignment.centerRight,
                child: Transform.scale(
                  scale: (){ if(currPageValue >= widget.items.length - 2 ) { return 1-r; } else {return 1.0;} }(),
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1), shape: BoxShape.circle),
                        child: IconButton(onPressed: (){ next(); }, icon: const Icon(Icons.keyboard_arrow_right, color: Colors.grey))
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),

        widget.indicatorBuilder?.call(context, currPageValue, widget.items.length) ?? const SizedBox(),

      ]

    );
  }

  void next() {
    int p = (controller.page?.floor() ?? 0) + 1;
    controller.animateToPage(p, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void back() {
    int p = controller.page!.floor() - 1;
    if(p < 0) p = 0;
    controller.animateToPage(p, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}