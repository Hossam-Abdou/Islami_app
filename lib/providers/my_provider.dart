import 'package:flutter/material.dart';
import 'package:islami_c11_str/services/shared_prefrence/cached_keys.dart';
import 'package:islami_c11_str/services/shared_prefrence/sp_helper.dart';


class MyProvider extends ChangeNotifier{


  ThemeMode mode = ThemeMode.light;

  Future<void>changeThemeMode(ThemeMode themeMode)async{
    mode= themeMode;

    await SharedPrefrenceHelper.saveData(key: CachedKeys.currentThemeMode, value: '${themeMode}');
    print('the theme is : ${mode}');
    print('the shared is : ${await SharedPrefrenceHelper.getData(key: CachedKeys.currentThemeMode)}');
    notifyListeners();
  }

  double rotationAngle = 0;
  int counter = 0;
  int currentIndex = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

  void incrementCounter() {
    counter++;
    rotationAngle--;
    if (counter == 33) {
      currentIndex++;
      counter = 0;
    }
    if (currentIndex > azkar.length - 1) {
      currentIndex = 0;
    }
    notifyListeners();
  }


}
