
extension MapX on Map {
  List toList() {
    List res = [];
    forEach((k, v) { res.add(v); });
    return res;
  }
}