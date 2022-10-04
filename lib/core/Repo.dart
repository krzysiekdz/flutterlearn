
import 'dart:convert';

import 'Response.dart' as okdev;
import 'package:http/http.dart' as http;

abstract class Repo<E> {

  String get host => 'okdev.hmcloud.pl';
  String get endPoint;
  String get listPoint => '$endPoint/list';

  Future<okdev.Response<E>> list({int start = 0, int limit = 10}) async {
    dynamic data;

    try {
      Uri uri = Uri.https(host, listPoint, {'start' : start.toString(), 'limit' : limit.toString()});
      print('uri: ${uri.toString()}');
      Future<http.Response> fr = http.get(uri);
      http.Response res = await fr;

      data = jsonDecode(res.body);
    } catch (e) {
      print('Error: ${e.toString()}');
      return okdev.Response(msg: 'Wystąpił błąd', code: -1);
    }

    List<E> items = [];

    if(data['rows'] is List) {
      List? rows = data['rows'];
      int size = rows?.length ?? 0;
      for(int i = 0; i < size; i++) {
        items.add(fromJson(rows?[i]));
      }
    }

    okdev.Response<E> response = okdev.Response();
    response.data = items;
    response.code = data['code'] ?? -1;
    response.msg = data['msg'] ?? '';

    return response;
//    return Future.delayed(const Duration(seconds: 2), () => response);
  }

  E fromJson(Map<String, dynamic> parsedJson);
}