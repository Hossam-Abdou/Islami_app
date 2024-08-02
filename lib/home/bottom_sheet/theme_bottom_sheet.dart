import 'package:flutter/material.dart';
import 'package:islami_c11_str/my_theme_data.dart';
import 'package:islami_c11_str/providers/my_provider.dart';
import 'package:islami_c11_str/services/shared_prefrence/cached_keys.dart';
import 'package:islami_c11_str/services/shared_prefrence/sp_helper.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              print(
                  'the shared is : ${await SharedPrefrenceHelper.getData(key: CachedKeys.currentThemeMode)}');
              themeProvider.changeThemeMode(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Light',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: themeProvider.mode == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : Colors.black),
                ),
                themeProvider.mode == ThemeMode.dark
                    ? const SizedBox.shrink()
                    : const Icon(
                        Icons.check,
                        color: MyThemeData.primaryColor,
                      ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () async {
              themeProvider.changeThemeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: themeProvider.mode == ThemeMode.dark
                          ? MyThemeData.primaryColor
                          : null),
                ),
                themeProvider.mode == ThemeMode.dark
                    ? Icon(
                        Icons.check,
                        color: themeProvider.mode == ThemeMode.dark
                            ? MyThemeData.primaryColor
                            : Colors.black,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
