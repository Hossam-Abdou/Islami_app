import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_c11_str/app_strings/app_strings.dart';
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
          InkWell(
            onTap: ()
            {
              context.setLocale(Locale("ar"));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.arabic.tr(),
                    style: context.locale == Locale("ar")
                        ? Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: MyThemeData.primaryColor)
                        : Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black,)),
                context.locale == Locale("ar") ? Icon(Icons.done,color: MyThemeData.primaryColor,) : SizedBox()
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              context.setLocale(Locale("en"));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.english.tr(),
                    style: context.locale == Locale("en")
                        ? Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: MyThemeData.primaryColor)
                        : Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black,)),
                context.locale == Locale("en") ? Icon(Icons.done,color: MyThemeData.primaryColor,) : SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
