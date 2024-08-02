import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c11_str/my_theme_data.dart';
import 'package:islami_c11_str/sura_model.dart';
import 'package:provider/provider.dart';

import 'providers/my_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetails";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    SuraModel model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(model.index);
    }

    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(  provider.mode == ThemeMode.light ? "assets/images/main_bg.png":"assets/images/dark_bg.png",),
              fit: BoxFit.cover)),

      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:  Icon(Icons.arrow_back,color: provider.mode==ThemeMode.dark?Colors.white:Colors.black,),
          ),
          title: Text(
            model.suraName,

          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            shape: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                  "${verses[index]} ($index)",
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color:provider.mode==ThemeMode.dark? MyThemeData.primaryColor:Colors.black),
                  textAlign: TextAlign.center,
                );
              },
              itemCount: verses.length,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suraLines = sura.split("\n");
    print(suraLines);
    verses = suraLines;
    setState(() {});
  }
}
