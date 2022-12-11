

class BsxJsonResponse {
  dynamic json;
  int code;
  String msg;

  BsxJsonResponse({this.json, this.code = 0, this.msg = ''});

  bool isSuccess() => code > 0;

  bool isError() => code <= 0;
}

class BsxResponse<T> extends BsxJsonResponse {
  T obj;//obj to np List<BsxModel>

  BsxResponse({ required BsxJsonResponse response, required this.obj }) {
    json = response.json;
    code = response.code;
    msg = response.msg;
  }

}

