import 'dart:convert';

import 'package:flutterlearn/bus_app/models/response.dart';
import 'package:http/http.dart' as http;

class Repo {

  final String host;
  final String app;
  final String endPoint;
  Function? mapItemFn;

  String get listPoint => '$app/$endPoint/list';

  Repo({ required this.endPoint, this.host = 'okdev.hmcloud.pl', this.app = 'buses', this.mapItemFn});


  Future<Response> list({ int start = 0, int limit = 10 }) async {
     dynamic data;
     http.Response r;
     try {
       Uri uri = Uri.https(host, listPoint,
           { 'start': start.toString(), 'limit': limit.toString()});
       print('REPO LIST : $uri');
       r = await http.post(uri);

       print('REPO LIST RESULT : ${r.body}');
       data = jsonDecode(r.body);
     } catch (e) {
       print('ERROR REPO LIST : ${e.toString()}');
       return Response(code: -999, msg: 'Wystapił błąd');
     }

     if(r.statusCode < 200 || r.statusCode >= 300) {
       print('REPO LIST STATUS CODE : ${r.statusCode}');
       return Response(code: -r.statusCode, msg: 'Wystąpił błąd (${r.statusCode})');
     }

     Response res = Response(
         code: data['code'] ?? -1,
         msg: data['msg'] ?? 'Wystąpił błąd (api-code: ${data['code'] ?? -1})'
     );

     if(res.isSuccess()) {
       res.data = [];

       if(data['rows'] is List ) {
         if(mapItemFn != null) { data['rows'].forEach((i) { res.data.add( mapItemFn!(i) ); }); }
         else { data['rows'].forEach((i) { res.data.add( i ); }); }
       }

     }

     return res;
  }



}