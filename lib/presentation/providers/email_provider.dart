import 'package:flutter/material.dart';

class EmailProvider extends ChangeNotifier {
  final String message = "";
  final String email = "";

  void setEmail(String email) {
    email = email;
    notifyListeners();
  }

  void setMessage(String message) {
    message = message;
    notifyListeners();
  }
}