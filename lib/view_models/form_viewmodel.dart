import 'package:flutter/material.dart';

class FormViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  bool validateForm() {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      return true;
    }
    return false;
  }

  void submitForm() {
    if (validateForm()) {
      // Handle form submission, like sending data to an API
      print("Form Submitted: Email: $_email, Password: $_password");
    } else {
      print("Form validation failed");
    }
  }
}
