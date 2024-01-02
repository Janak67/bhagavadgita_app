import 'package:bhagavadgita_app/screen/home/model/name_model.dart';
import 'package:bhagavadgita_app/screen/home/model/shloka_model.dart';
import 'package:bhagavadgita_app/screen/home/model/title_model.dart';

class HomeModel {
  final int id;
  final String hindi, meaning, english, image;
  NameModel? nameModel;
  TitleModel? titleModel;
  ShlokaModel? shlokaModel;

  HomeModel(
      {required this.id,
      required this.hindi,
      required this.meaning,
      required this.english,
      required this.image,
      required this.nameModel,
      required this.titleModel,
      required this.shlokaModel});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
      id: m1['id'],
      hindi: m1['hindi'],
      meaning: m1['meaning'],
      english: m1['english'],
      image: m1['image'],
      nameModel: NameModel.mapToModel(m1['name']),
      titleModel: TitleModel.mapToModel(m1['title']),
      shlokaModel: ShlokaModel.mapToModel(m1['shloka']),
    );
  }
}
