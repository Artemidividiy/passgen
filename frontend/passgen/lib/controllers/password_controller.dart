import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:developer' as developer;
import 'package:passgen/models/password_model.dart';
import 'package:http/http.dart' as http;

import '../utils/settings.dart';

class PasswordController {
  static Future<String> _loadConfig() {
    return rootBundle.loadString("lib/constants/urls.json");
  }

  static Future<Password?> get() async {
    try {
      var response = await http.post(Uri.parse("http://127.0.0.1:5000"),
          headers: {
            "Content-type": "application/json",
          },
          body: json.encode(Settings.getSettings));
      var data = json.decode(response.body)[0];
      return Password(
          alphabets_count: data["alphabets_count"],
          digits_count: data["digits_count"],
          length: data["length"],
          password: data["password"],
          seed: data["seed"],
          special_characters_count: data["special_characters_count"]);
    } catch (e) {
      developer.log("[GET] something went wrong\n", error: e);
    }
  }
}
