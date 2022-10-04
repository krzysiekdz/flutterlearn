
class Logger {

  bool _showLog = true;
  set showLog(bool v) { _showLog = v; }

  void print(String msg) {
    if( _showLog ) {
      print( msg );
    }
  }
}