
class BsxModel {
  Map<String, dynamic> data;

  BsxModel( { this.data = const {} } );

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