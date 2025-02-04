import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String lang = "ENG";

  void setLangPTBR() {
    lang = "PT-BR";
    notifyListeners();
  }

  void setLangENG() {
    lang = "ENG";
    notifyListeners();
  }
}