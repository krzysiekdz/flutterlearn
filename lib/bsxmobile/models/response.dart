

class JsonResponse {
  dynamic json;
  int code;
  String msg;

  JsonResponse({this.json, this.code = 0, this.msg = ''});

  bool isSuccess() => code > 0;

  bool isError() => code <= 0;
}

class ObjResponse<T> extends JsonResponse {
  T obj;//obj to np List<BsxModel>

  ObjResponse({ required JsonResponse response, required this.obj }) {
    json = response.json;
    code = response.code;
    msg = response.msg;
  }

}

