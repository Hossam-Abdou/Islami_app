import 'package:flutter/material.dart';
import 'package:islami_c11_str/my_theme_data.dart';
import 'package:islami_c11_str/providers/my_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheeet extends StatelessWidget {
  const LanguageBottomSheeet({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Arabic',
                style: themeProvider.mode == ThemeMode.dark
                    ? Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.black)
                    : Theme.of(context).textTheme.bodySmall,
              ),
              // Icon(
              //   Icons.check,
              //   color: MyThemeData.primaryColor,
              // ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'English',
                style: themeProvider.mode == ThemeMode.dark
                    ? Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: MyThemeData.primaryDarkColor)
                    : Theme.of(context).textTheme.bodySmall,
              ),
              Icon(
                Icons.check,
                color: MyThemeData.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
