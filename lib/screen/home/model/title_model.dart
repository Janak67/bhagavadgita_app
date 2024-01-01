class TitleModel {
  final String titleH, titleG, titleE;

  TitleModel(
      {required this.titleH, required this.titleG, required this.titleE});

  factory TitleModel.mapToModel(Map m1) {
    return TitleModel(
      titleH: m1['titleH'],
      titleG: m1['titleG'],
      titleE: m1['titleE'],
    );
  }
}
