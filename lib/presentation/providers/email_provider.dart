import 'package:flutter/material.dart';

class EmailProvider extends ChangeNotifier {
  String message = "";
  String email = "";

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setMessage(String value) {
    message = value;
    notifyListeners();
  }

  void clearFields() {
    message = "";
    email = "";
  }
}