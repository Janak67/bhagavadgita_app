import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/share_helper.dart';

class DetailsProvider with ChangeNotifier {
  bool isLight = true;
  String language = 'Gujarati';

  void changeTheme() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
  }

  void languageStatus(String value) {
    language = value;
    notifyListeners();
  }

  void copyToClipboard(String shloka) {
    Clipboard.setData(ClipboardData(text: shloka));
    notifyListeners();
  }
}
