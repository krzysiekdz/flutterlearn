
class BsxModel {
  Map<String, dynamic> _data;

  BsxModel( { Map<String, dynamic>? data } ) : _data = data ?? const {};

  Map<String, dynamic> get data => _data;

  set data(Map<String, dynamic> d) { _data = d; }

  dynamic get(String key) {
    if( data.containsKey(key) ) { return data[key]; }
    else { return null; }
  }

  BsxModel set(String key, dynamic value) {
    data[key] = value;
    return this;
  }

  operator [](String key) { return get(key); }

}