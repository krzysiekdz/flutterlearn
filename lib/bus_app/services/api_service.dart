import 'dart:convert';
import 'package:flutterlearn/bus_app/bus_app.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


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
    //      if(config.isDevMode) {
//        params['debug'] = '1';
//        params['wwwdebug'] = '1';
//      }
//      if(session.token != '' && !options.containsKey('ignoreToken')) {
//        params['token'] = session.token;
//      }

    return _send( () async {
      Uri uri = Uri.https(host, '$mode/$endpoint', params);
      print('$name API POST : $uri');
      http.Response r = await http.post(uri);

      print('$name API RESULT : ${r.body}');
      return _ResponseData(data: jsonDecode(r.body), r: r);
    });
  }

  Future<JsonResponse> sendFile(FileData fileData, { Map<String, String> params = const {} }) async {
    return _send(() async {
      Uri uri = Uri.https(host, '$mode/attachments/upload');
      var req = http.MultipartRequest('POST', uri)
        ..fields.addAll(params)
        ..files.add(
            http.MultipartFile.fromBytes(
                'att',
                fileData.bytes,
                filename: fileData.fileName,
                contentType: MediaType.parse(fileData.mimeType)
            )
          );

      http.StreamedResponse res = await req.send();
      dynamic d = jsonDecode( await res.stream.bytesToString() ); //np: {"tmp_name":"phpHyXF77","code":1}

      return _ResponseData(data: d, r: res);
    });
  }

  Future<JsonResponse> _send( Future<_ResponseData> Function() action )  async {
    _ResponseData rd;
    try {
      rd = await action();
    } catch (e) { //czy nie ma bledu parsowania
      print('$name API ERROR : ${e.toString()}');
      //return  responseHandler( JsonResponse(code: -999, msg: 'Wystapił błąd') );
      return  JsonResponse(code: -999, msg: 'Wystapił błąd');
    }

    //czy nie ma bledu http
    if(rd.r.statusCode < 200 || rd.r.statusCode >= 300) {
      print('$name API STATUS CODE : ${rd.r.statusCode}');
      //return responseHandler( JsonResponse(code: -r.statusCode, msg: 'Wystąpił błąd ( ${r.statusCode} )') );
      return JsonResponse(code: -rd.r.statusCode, msg: 'Wystąpił błąd ( ${rd.r.statusCode} )');
    }

    dynamic code = rd.data['code'] ?? -1;
    dynamic msg = rd.data['msg'] ?? '';

    if(code is String) code = int.parse(code);
    JsonResponse res = JsonResponse(code: code);

    res.json = rd.data;
    if(res.isError()) {
      res.msg = msg == '' ? 'Wystąpił błąd ( $code )' : msg ;
    }

    //return  responseHandler(res);
    return  res;
  }


}

class _ResponseData {
  dynamic data;
  http.BaseResponse r;

  _ResponseData({ required this.data, required this.r });
}