import 'dart:convert';

import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/models/session.dart';
import 'package:http/http.dart' as http;
import 'package:flutterlearn/bsxmobile/models/response.dart';

class BsxApiService {

  final String host;
  final String mode;
  final Config config;
  Session session; //sesja przekazywana z głównego widgetu MpFirma

  BsxApiService( {this.host = 'api.bsxonline.pl', this.mode = 'api/mp', required this.config, required this.session} );

  Future<Response> post({
    required String endpoint,
    Map<String, String> params = const {},
    Map<String, String> options = const {},
  })  async {
    dynamic data;
    http.Response r;
    try {
      if(config.isDevMode) {
        params['debug'] = '1';
        params['wwwdebug'] = '1';
      }
      Uri uri = Uri.https(host, '$mode/$endpoint', params);
      print('BSX API POST : $uri');
      r = await http.post(uri);

      print('BSX API RESULT : ${r.body}');
      data = jsonDecode(r.body);
    } catch (e) { //czy nie ma bledu parsowania
      print('BSX API ERROR : ${e.toString()}');
      return Response(code: -999, msg: 'Wystapił błąd');
    }

    //czy nie ma bledu http
    if(r.statusCode < 200 || r.statusCode >= 300) {
      print('BSX API STATUS CODE : ${r.statusCode}');
      return Response(code: -r.statusCode, msg: 'Wystąpił błąd ( ${r.statusCode} )');
    }

    //czy api nie zwraca bledu
    Response res = Response(code: data['resultCode'] ?? -1);

    //odpowiedź api bez błędu - analizujemy
    if(res.isSuccess()) {
      res.data = data;
    }
    else {
      res.msg = data['errorStr'] ?? 'Wystąpił błąd (! ${data['resultCode'] ?? -1})' ;
    }

    return res;
  }



}