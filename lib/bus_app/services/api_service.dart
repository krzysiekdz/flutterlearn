import 'dart:convert';
import 'package:flutterlearn/bus_app/bus_app.dart';
import 'package:http/http.dart' as http;


class ApiService {

  final String host;
  final String mode;
  final String name;
//  final Config config;
//  Session session; //sesja przekazywana z głównego widgetu MpFirma
//  BsxApiResponseHandler responseHandler;

  ApiService( {
    this.host = 'okdev.hmcloud.pl',
    this.mode = 'buses',
    this.name = 'OKDEV/BUSES',
  } );

  Future<JsonResponse> post({required String endpoint, Map<String, String> params = const {},})  async {
    dynamic data;
    http.Response r;
    try {
//      if(config.isDevMode) {
//        params['debug'] = '1';
//        params['wwwdebug'] = '1';
//      }
//      if(session.token != '' && !options.containsKey('ignoreToken')) {
//        params['token'] = session.token;
//      }
      Uri uri = Uri.https(host, '$mode/$endpoint', params);
      print('$name API POST : $uri');
      r = await http.post(uri);

      print('$name API RESULT : ${r.body}');
      data = jsonDecode(r.body);
    } catch (e) { //czy nie ma bledu parsowania
      print('$name API ERROR : ${e.toString()}');
//      return  responseHandler( JsonResponse(code: -999, msg: 'Wystapił błąd') );
      return  JsonResponse(code: -999, msg: 'Wystapił błąd');
    }

    //czy nie ma bledu http
    if(r.statusCode < 200 || r.statusCode >= 300) {
      print('$name API STATUS CODE : ${r.statusCode}');
//      return responseHandler( JsonResponse(code: -r.statusCode, msg: 'Wystąpił błąd ( ${r.statusCode} )') );
      return JsonResponse(code: -r.statusCode, msg: 'Wystąpił błąd ( ${r.statusCode} )');
    }

    dynamic code = data['code'] ?? -1;
    dynamic msg = data['msg'] ?? '';

    if(code is String) code = int.parse(code);
    JsonResponse res = JsonResponse(code: code);

    res.json = data;
    if(res.isError()) {
      res.msg = msg == '' ? 'Wystąpił błąd ( $code )' : msg ;
    }

//    return  responseHandler(res);
    return  res;
  }



}