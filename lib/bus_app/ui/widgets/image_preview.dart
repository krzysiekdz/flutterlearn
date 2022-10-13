import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/widgets/slider.dart';
import 'package:flutterlearn/styles/Styles.dart';

class ImagePreview extends StatefulWidget {
  final String imgSrc;
  final List<String> listImgSrc;

  const ImagePreview({super.key, required this.imgSrc, required this.listImgSrc});

  @override
  State<StatefulWidget> createState() => _ImagePreviewState();

}

class _ImagePreviewState extends State<ImagePreview>  with AutomaticKeepAliveClientMixin<ImagePreview> {

  @override
  void initState() {
    super.initState();
    print('ImagePreview: initState(), key = ${widget.key}');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('ImagePreview: build() ${widget.imgSrc}');

    return GestureDetector(
        onTap: () { onClick(context); },
        child: Image.asset(widget.imgSrc)
    );
  }

  @override
  bool get wantKeepAlive => true;

  void onClick(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ImagePopup(imgSrc: widget.imgSrc, listImgSrc: widget.listImgSrc,) )
    );
//    showDialog(context: context, builder: (context) =>
//        AlertDialog(
//            title: Text(widget.imgSrc),
//            content: ImagePopup(imgSrc: widget.imgSrc),
//            actions: [
//              TextButton(onPressed: (){ Navigator.of(context).pop(); }, child: Text('Zamknij'))
//            ],
//        )
//    );
  }
}


class ImagePopup extends StatelessWidget {
  final String imgSrc;
  final List<String> listImgSrc;

  const ImagePopup({super.key, required this.imgSrc, required this.listImgSrc});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Material(
        child: Stack(
          children: [

            InteractiveViewer(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(imgSrc).image,
                      fit: (size.height > size.width) ? BoxFit.fitWidth : BoxFit.fitHeight,
                    )
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: TextButton.icon(onPressed: (){ Navigator.of(context).pop(); }, icon: const Icon(Icons.close), label: const Text('Zamknij')),
            )

          ],
        )
      ),
    );

//    return SafeArea(
//      child: Material(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//
//              CSlider(
//                items: listImgSrc.map((e) =>
//                    InteractiveViewer(
//                      child: Container(
//                        decoration: BoxDecoration(
//                            image: DecorationImage(
//                              image: Image.asset(e).image,
//                              fit: (size.height > size.width) ? BoxFit.fitWidth : BoxFit.fitHeight,
//                            )
//                        ),
//                      ),
//                    ),
//                ).toList()
//              ),
//
//
//            ]
//          ),
//      ),
//    );
  }
}