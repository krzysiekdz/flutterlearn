
class Response<T> {
    List<T>? data;
    int code = 0;
    String msg = "";

    Response({this.data, this.code = 0, this.msg = ''});
}