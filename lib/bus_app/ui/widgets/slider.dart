import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/styles/Styles.dart';

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
  Widget build(BuildContext context) {
//    print('Slider: build() , currPage = $currPageValue');
    return Column(
      children: [

        Container(
          height: widget.height,
          decoration: blackBorder(),
          child: Stack(
            children: [
              PageView.builder(
                pageSnapping: true,
                physics: const BouncingScrollPhysics(),
                controller: controller,
                itemCount: widget.items.length,
                itemBuilder: (context, i) {
                  double r = currPageValue - currPageValue.floor();

                  if( i == currPageValue.floor() ) {
                    return Transform.scale(scale: 1 - r , child: widget.items[i] );
                  }
                  else if ( i == currPageValue.floor() + 1) {
                    return Transform.scale(scale: r , child: widget.items[i] );
                  }
                  else {
                    return widget.items[i];
                  }
                },
              ),

              IconButton(alignment: Alignment.centerLeft, onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_left)),

              IconButton(alignment: Alignment.centerRight, onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_right)),
            ],
          ),
        ),

        widget.indicatorBuilder?.call(context, currPageValue, widget.items.length) ?? const SizedBox(),

      ]

    );
  }
}