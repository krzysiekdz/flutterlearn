

class BsxRawResponse {
  dynamic raw;
  int code;
  String msg;

  BsxRawResponse({this.raw, this.code = 0, this.msg = ''});

  bool isSuccess() => code > 0;

  bool isError() => code <= 0;
}

class BsxResponse<T> extends BsxRawResponse {
  T obj;

  BsxResponse({ required BsxRawResponse response, required this.obj }) {
    raw = response.raw;
    code = response.code;
    msg = response.msg;
  }

}

//zamiast bsx list response uzyc: BsxResponse<List<BsxModel>> a zamiast get uzyc : BsxResponse<BsxModel>

