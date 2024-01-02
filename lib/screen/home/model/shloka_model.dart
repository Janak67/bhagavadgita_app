class ShlokaModel {
  String? shlokaHindi, shlokaGujarati, shlokaEnglish;

  ShlokaModel(
      {required this.shlokaHindi,
      required this.shlokaGujarati,
      required this.shlokaEnglish});

  factory ShlokaModel.mapToModel(Map m1) {
    return ShlokaModel(
      shlokaHindi: m1['shlokaHindi'],
      shlokaGujarati: m1['shlokaGujarati'],
      shlokaEnglish: m1['shlokaEnglish'],
    );
  }
}
