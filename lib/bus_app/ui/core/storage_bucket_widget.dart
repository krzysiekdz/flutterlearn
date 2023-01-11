import 'package:flutterlearn/bus_app/bus_app.dart';

mixin StorageBucketWidget {
  late PageStorageBucket bucket;

  void initBucket(BuildContext context) {
    bucket = PageStorage.of(context)!;
  }
}