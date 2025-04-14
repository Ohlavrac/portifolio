import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
          "service_id": dotenv.env["EMAIL_SERVICE_ID"] ?? const String.fromEnvironment("EMAIL_SERVICE_ID"),
          "template_id": dotenv.env["EMAIL_TEMPLATE_ID"] ?? const String.fromEnvironment("EMAIL_TEMPLATE_ID"),
          "user_id": dotenv.env["EMAIL_USER_ID"] ?? const String.fromEnvironment("EMAIL_USER_ID"),
          "template_params": {
            "name": name,
            "email": email,
            "message": message,
            "title": title,
          }
        })
      );

      print(email);
      print(const String.fromEnvironment("EMAIL_SERVICE_ID"));
      
      _isSending = false;
      notifyListeners();
      print(response.statusCode);
      return response.statusCode == 200;
    } catch (error) {
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