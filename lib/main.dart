import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_c11_str/hadeth_details.dart';
import 'package:islami_c11_str/home/home.dart';
import 'package:islami_c11_str/my_theme_data.dart';
import 'package:islami_c11_str/services/shared_prefrence/cached_keys.dart';
import 'package:islami_c11_str/services/shared_prefrence/sp_helper.dart';
import 'package:islami_c11_str/sura_details.dart';
import 'package:provider/provider.dart';

import 'providers/my_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefrenceHelper.init();
  // await SecureStorage.init();
  await EasyLocalization.ensureInitialized();

  // Fetch the saved theme mode
  String? savedThemeMode = await SharedPrefrenceHelper.getData(key: CachedKeys.currentThemeMode);
  ThemeMode initialThemeMode = ThemeMode.light; // Default theme mode

  if (savedThemeMode != null) {
    if (savedThemeMode == ThemeMode.dark.toString()) {
      initialThemeMode = ThemeMode.dark;
    }
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider()..mode = initialThemeMode,
      child: EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/locales',
          saveLocale: true,
          child: MyApp()),
    ),

  );
}


class MyApp extends StatelessWidget {
// ThemeMode? currentThemeMode;
//
// MyApp({this.currentThemeMode});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: HomeScreen.routeName,
      themeMode: provider.mode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
