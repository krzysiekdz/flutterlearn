
extension MapX<K, V> on Map<K, V> {
  List<V> toList() {
    List<V> res = [];
    forEach((k, v) { res.add(v); });
    return res;
  }
}