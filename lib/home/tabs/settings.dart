import 'package:flutter/material.dart';
import 'package:islami_c11_str/home/bottom_sheet/language_bottom_sheeet.dart';
import 'package:islami_c11_str/home/bottom_sheet/theme_bottom_sheet.dart';
import 'package:islami_c11_str/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});
  static const String routeName = "SettingTab";

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Themes"),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => ThemeBottomSheet(),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: themeProvider.mode==ThemeMode.dark?Colors.white:Theme.of(context).primaryColor),
              ),
              child: Text(themeProvider.mode == ThemeMode.light ? "Light" : "Dark"),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Text("Language"),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => LanguageBottomSheeet(),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: themeProvider.mode==ThemeMode.dark?Colors.white:Theme.of(context).primaryColor),
              ),
              child: Text('English'),
            ),
          )
        ],
      ),
    );
  }
}
