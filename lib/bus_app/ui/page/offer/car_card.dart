import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/models/car.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/bus_app/ui/widgets/slider.dart';
import 'package:flutterlearn/core/Functions.dart';
import 'package:flutterlearn/styles/Styles.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CustomStyles.padding),
//      decoration: blackBorder(),
      child: Column(
        children: [
          CSlider(
              height: 150,
              items: car.img.map( (e) => ImageItem(imgSrc: e) ).toList(),
              indicatorBuilder: (context, position, length) => Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ Text( '${ (position - position.floor()) >= 0.5 ? position.floor() + 2 : position.floor() + 1}/$length' ) ],
              ),
          ),
          gap(),
          Row(children: [ Text(car.title, style: header3()) ]),
          gap(h:4),
          Row(children: [Text(car.places, style: const TextStyle(color: Colors.grey) )]),
          gap(h:4),
          Text(car.descr),
        ],
      ),
    );
  }
}

class ImageItem extends StatefulWidget {
  final String imgSrc;

  const ImageItem({required this.imgSrc});

  @override
  State<StatefulWidget> createState() => _ImageItemState();

}

class _ImageItemState extends State<ImageItem> with AutomaticKeepAliveClientMixin<ImageItem>{

  @override
  void initState() {
    super.initState();

    print('ImageItem: initState()');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('ImageItem: build() ${widget.imgSrc}');
    return Image.asset(widget.imgSrc);
  }

  @override
  bool get wantKeepAlive => true;


}