
class BsxModel {
  Map<String, dynamic> _data;

  BsxModel( { Map<String, dynamic>? data } ) : _data = data ?? const {};

  Map<String, dynamic> get data => _data;

  set data(Map<String, dynamic> d) { _data = d; }

  BsxModel set(String key, dynamic value) {
    data[key] = value;
    return this;
  }

  operator [](String key) => data[key] ?? '';

  void operator []=(String key, dynamic v) { data[key] = v; }

}