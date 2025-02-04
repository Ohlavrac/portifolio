import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/language_provider.dart';
import 'package:portifolio/utils/languages.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {

    var languageProvider = Provider.of<LanguageProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row (
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultTextStyle(
                style: TextStyle(),
                child: Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "${getValueByLangAndKey(languageProvider.lang, "name")}:\n", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: "João Victor Rodrigues Carvalho")
                  ]
                )),
              ),
              DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: Text("#0023"))
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("./assets/images/profile.png", scale: 2.5,),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), child: Text("${getValueByLangAndKey(languageProvider.lang, "software_engineer")}.")),
                SizedBox(height: 8,),
                DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), child: Text("${getValueByLangAndKey(languageProvider.lang, "education")}:")),
                DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.normal), child: Text("${getValueByLangAndKey(languageProvider.lang, "graduation_type")}.")),
                DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.normal), child: Text(getValueByLangAndKey(languageProvider.lang, "education"))),
                DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.normal), child: Text(getValueByLangAndKey(languageProvider.lang, "college"))),              
                DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.normal), child: Text(getValueByLangAndKey(languageProvider.lang, "college_period"))),
              ],
            )
          ],
        ),
        SizedBox(height: 10,),
        DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: Text("${getValueByLangAndKey(languageProvider.lang, "about_me")}:")),
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 10),
          child: DefaultTextStyle(style: TextStyle(), child: Text(textAlign: TextAlign.justify, getValueByLangAndKey(languageProvider.lang, "about_me_text"))),
        ),
        DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: Text("${getValueByLangAndKey(languageProvider.lang, "programming_langs")}:")),
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 10),
          child: DefaultTextStyle(style: TextStyle(), child: Text("Dart | Java | Javascript | Python | C | Lua | Typescript"),),
        ),
        DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: Text("${getValueByLangAndKey(languageProvider.lang, "tecnologies")}:")),
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 10),
          child: DefaultTextStyle(style: TextStyle(), child: Text("Flutter | Spring Boot | Express | Firebase | Prisma | MySQL | MongoDB | PostgreSQL"),),
        ),
        DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: Text("${getValueByLangAndKey(languageProvider.lang, "languages")}:")),
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 10),
          child: DefaultTextStyle(style: TextStyle(), child: Text(getValueByLangAndKey(languageProvider.lang, "languages_content")),),
        ),
      ],
    );
  }
}