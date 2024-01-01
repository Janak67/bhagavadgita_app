class NameModel {
  final String hindi, gujarati, english;

  NameModel(
      {required this.hindi, required this.gujarati, required this.english});

  factory NameModel.mapToModel(Map m1) {
    return NameModel(
      hindi: m1['hindi'],
      gujarati: m1['gujarati'],
      english: m1['english'],
    );
  }
}
