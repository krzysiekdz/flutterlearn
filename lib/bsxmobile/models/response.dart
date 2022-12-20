
abstract class BaseResponse {
  int code;
  String msg;

  BaseResponse({this.code = 1, this.msg = ''});

  bool isSuccess() => code > 0;

  bool isError() => code <= 0;
}

class JsonResponse extends BaseResponse {
  dynamic json;
  JsonResponse({this.json, super.code, super.msg});
}

class ObjResponse<T> extends JsonResponse {
  T? obj;//obj to np List<BsxModel>

  ObjResponse({ super.code, super.msg,  this.obj });

  ObjResponse.error([String m = '']) : super( code: -1, msg: m);

  ObjResponse.fromJsonR({ required JsonResponse response, this.obj }) {
    json = response.json;
    code = response.code;
    msg = response.msg;
  }

}

