import 'package:flutter/foundation.dart';

class FileData {
  String fileName;
  String mimeType;
  Uint8List bytes = Uint8List.fromList([]);

  FileData({ this.fileName = '', this.mimeType = 'plain/text',  Uint8List? bytes }) {
    if(bytes != null) { this.bytes = bytes; }
  }

  @override
  String toString() => 'fileName = $fileName, mimeType = $mimeType, bytes[0] = ${bytes[0]}';
}