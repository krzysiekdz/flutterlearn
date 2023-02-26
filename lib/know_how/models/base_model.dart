

class BaseModel {
  Map<String, dynamic> _data;
  bool isDirty = false;
//  StreamController<List>? streamController;
//  bool useStream;

  BaseModel( { Map<String, dynamic>? data} ) : _data = data ?? {} {
//    if( useStream ) { streamController = StreamController<List>(); }
  }

  Map<String, dynamic> get data => _data;

  set data(Map<String, dynamic> d) { _data = d; }

  BaseModel set(String key, dynamic value) {
    data[key] = value;
    isDirty = true;
//    if(useStream) {
//      streamController!.sink.add( [key, value] );
//    }
    return this;
  }

  operator [](String key) => data[key] ?? '';

  void operator []=(String key, dynamic v) { set(key, v); }

  @override
  String toString() => '$data';

  Map<String, String> toMap() { return {}; }

  @override
  bool operator ==(Object other) {
    if(runtimeType == other.runtimeType) {
      print('type = $runtimeType, other type = ${other.runtimeType}');
      BaseModel m2 = other as BaseModel;
      //todo
      return data == m2.data;
    }
    else { return super == other; }
  }

  void dispose() {
//    if(useStream) {
//      streamController!.close();
//    }
  }

}