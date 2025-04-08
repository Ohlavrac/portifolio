import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmailProvider extends ChangeNotifier {
  bool _isSending = false;


  String message = "";
  String email = "";

  Future<bool> sendEmail({
    required String name,
    required String email,
    required String message,
    required String title,
  }) async {
    _isSending = true;
    notifyListeners();
    final emailServiceURL = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

    try {
      final response = await http.post(
        emailServiceURL,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "service_id": const String.fromEnvironment("EMAIL_SERVICE_ID"),
          "template_id": const String.fromEnvironment("EMAIL_TEMPLATE_ID"),
          "user_id": const String.fromEnvironment("EMAIL_USER_ID"),
          "template_params": {
            "name": name,
            "email": email,
            "message": message,
            "title": title,
          }
        })
      );

      String seila = const String.fromEnvironment("EMAIL_SERVICE_ID");

      print(seila);

      
      _isSending = false;
      notifyListeners();

      print(response.body);
      print(response.statusCode);

      return response.statusCode == 200;
    } catch (error) {
      print("error: $error");
      _isSending = false;
      notifyListeners();
      return false;
    }
  }

  bool getIsSending() {
    return _isSending;
  }

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