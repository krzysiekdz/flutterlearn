

class BaseModel {
  Map<String, dynamic> _data;

  BaseModel( { Map<String, dynamic>? data } ) : _data = data ?? const {};

  Map<String, dynamic> get data => _data;

  set data(Map<String, dynamic> d) { _data = d; }

  BaseModel set(String key, dynamic value) {
    data[key] = value;
    return this;
  }

  operator [](String key) => data[key] ?? '';

  void operator []=(String key, dynamic v) { data[key] = v; }

  @override
  String toString() => '$data';

}