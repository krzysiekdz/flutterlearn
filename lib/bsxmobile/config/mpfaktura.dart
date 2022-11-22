import 'package:flutter/foundation.dart';
import 'package:flutterlearn/bsxmobile/config/mpfirma.dart';

class MpFakturaConfig extends MpFirmaConfig{

  /*
  * app name
  * */
  @override
  String get appName => 'mpFaktura';


  /*
  * assets
  * */

  @override
  String get assets {
    if( kIsWeb ) {
      return 'images/bsxmobile/mpfaktura/';
    }
    else {
      return 'assets/images/bsxmobile/mpfaktura/';
    }
  }

}