import 'package:bhagavadgita_app/screen/home/model/home_model.dart';
import 'package:bhagavadgita_app/utils/json_helper.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  List<HomeModel> homeList = [];

  Future<void> getData() async {
    JsonHelper jsonHelper = JsonHelper();
    List<HomeModel> title = await jsonHelper.homeJsonToList();
    homeList = title;
    notifyListeners();
  }
}
