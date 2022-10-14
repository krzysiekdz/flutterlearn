import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/models/car.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/bus_app/ui/widgets/image_preview.dart';
import 'package:flutterlearn/bus_app/ui/widgets/slider.dart';
import 'package:flutterlearn/core/widgets.dart';


class CarCard extends StatefulWidget {
  final Car car;
  const CarCard({super.key, required this.car});

  @override
  State<StatefulWidget> createState() => _CardCarState();
}

class _CardCarState extends State<CarCard> {
//  late final Map<String, UniqueKey> imgKeys;

  @override
  void initState() {
    super.initState();

//    imgKeys = {};
//    for(String i in widget.car.img) {
//      imgKeys[i] = UniqueKey();
//    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CustomStyles.padding),
//      decoration: blackBorder(),
      child: Column(
        children: [
          CSlider(
            height: 150,
            items: widget.car.img.map( (e) => ImagePreview(imgSrc: e, listImgSrc: widget.car.img,) ).toList(),
            indicatorBuilder: (context, position, length) => Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ Text( '${ (position - position.floor()) >= 0.5 ? position.floor() + 2 : position.floor() + 1}/$length' ) ],
            ),
          ),
          gap(),
          Row(children: [ Text(widget.car.title, style: header3()) ]),
          gap(h:4),
          Row(children: [Text(widget.car.places, style: const TextStyle(color: Colors.grey) )]),
          gap(h:4),
          Text(widget.car.descr),
        ],
      ),
    );
  }
}

