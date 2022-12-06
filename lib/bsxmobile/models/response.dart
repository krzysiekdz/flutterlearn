
class Response {
  dynamic data;
  int code;
  String msg;

  Response({this.data, this.code = 0, this.msg = ''});

  bool isSuccess() => code > 0;

  bool isError() => code <= 0;
}