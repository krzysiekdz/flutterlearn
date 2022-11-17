class SampleData {
  List<int> data;
  int size;

  SampleData({this.size = 20}) : data = List.generate(size, (i) => i*10);
}