import 'package:flutterlearn/bus_app/bus_app.dart';

class TestWidget extends StatefulWidget {

  const TestWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TestWidgetState();

}

class _TestWidgetState extends State<TestWidget> {

  late final Stream stream;

  @override
  void initState() {
    super.initState();

    stream = Stream<int>.periodic( const Duration(seconds: 1), (i) => i ).take(10);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: CustomColors.greyLight),
      width: double.infinity,
      padding: const EdgeInsets.only(left: CustomStyles.padding),
      child: StreamBuilder<int>(
        stream: stream as Stream<int>,
        builder: (context, snapshot) {
          if(!snapshot.hasData) { return const CircularProgressIndicator(); }
          return Text('${snapshot.data}');
        },
      ),
    );
  }
}