import 'dart:convert';
import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:passgen/constants/hive_box_namings.dart';

part 'settings.g.dart';

class Settings {
  static late int _alphabetsCount;
  static late int _passwordCount;
  static late int _digitsCount;
  static late int _length;
  static late int _specialCharactersCount;
  static void init() {
    final box = Hive.box<HiveSettingsBox>(SETTINGS_BOX);
    try {
      HiveSettingsBox? hsb = box.getAt(0);
      if (hsb != null) {
        alphabetsCount = hsb.alphabetsCount;
        digitsCount = hsb.digitsCount;
        specialCharactersCount = hsb.specialCharactersCount;
        length = hsb.length;
        _passwordCount = hsb.passwordCount;
      } else {
        alphabetsCount = 10;
        digitsCount = 4;
        specialCharactersCount = 2;
        length = 16;
        _passwordCount = 1;
      }
    } catch (e) {
      log("hive issue", error: e);
      alphabetsCount = 10;
      digitsCount = 4;
      specialCharactersCount = 2;
      length = 16;
      _passwordCount = 1;
    }
  }

  static set alphabetsCount(int value) => _alphabetsCount = value;
  static set digitsCount(int value) => _digitsCount = value;
  static set length(int value) => _length = value;
  static set passwordCount(int value) => _passwordCount = value;
  static set specialCharactersCount(int value) =>
      _specialCharactersCount = value;

  static int get length => _length;
  static int get alphabetsCount => _alphabetsCount;
  static int get digitsCount => _digitsCount;
  static int get specialCharactersCount => _specialCharactersCount;

  static Map<String, int> get getSettings => {
        "seed": 0,
        "password_count": 1,
        "alphabets_count": _alphabetsCount,
        "password_count": _passwordCount,
        "digits_count": _digitsCount,
        "length": _length,
        "special_characters_count": _specialCharactersCount
      };
  toJson() {
    return json.encode(getSettings);
  }
}

@HiveType(typeId: 0)
class HiveSettingsBox extends HiveObject {
  @HiveField(0)
  late int alphabetsCount;
  @HiveField(1)
  late int digitsCount;
  @HiveField(2)
  late int specialCharactersCount;
  @HiveField(3)
  late int length;
  @HiveField(4)
  late int passwordCount;
}
