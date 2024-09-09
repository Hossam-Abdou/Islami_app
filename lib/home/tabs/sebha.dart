import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_c11_str/app_strings/app_strings.dart';
import 'package:islami_c11_str/home/bottom_sheet/language_bottom_sheeet.dart';
import 'package:islami_c11_str/my_theme_data.dart';
import 'package:islami_c11_str/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaTab> {

  @override
  Widget build(BuildContext context) {
    var sebhaProvider = Provider.of<MyProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                sebhaProvider.incrementCounter();
              },
              child: Transform.rotate(
                angle: sebhaProvider.rotationAngle * (3.14 / 180),
                child: Center(
                  child: Image.asset('assets/images/${sebhaProvider.mode == ThemeMode.light?'body_sebha_logo':'body_sebha_dark'}.png'),
                ),
              ),
            ), const SizedBox(
              height: 41,
            ),
            Text(
              AppStrings.praisesCountNumber.tr(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Container(
              width: 70,
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MyThemeData.primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                sebhaProvider.counter.toString(),
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Container(
              width: 140,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MyThemeData.primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                sebhaProvider.azkar[sebhaProvider.currentIndex],
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
