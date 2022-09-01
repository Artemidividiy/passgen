import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:passgen/constants/hive_box_namings.dart';
import 'package:passgen/utils/settings.dart';

class BottomSheetComponent extends StatefulWidget {
  const BottomSheetComponent({super.key});

  @override
  State<BottomSheetComponent> createState() => _BottomSheetComponentState();
}

class _BottomSheetComponentState extends State<BottomSheetComponent> {
  late Map<String, dynamic> settings;
  late int length, alphabetsCount, specialCharactersCount, digitsCount;
  @override
  void initState() {
    length = Settings.length;
    alphabetsCount = Settings.alphabetsCount;
    specialCharactersCount = Settings.specialCharactersCount;
    digitsCount = Settings.digitsCount;
    settings = Settings.getSettings;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _pop,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45), color: Colors.white),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Password length",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            NumberPicker(
                selectedTextStyle: TextStyle(color: Colors.black, fontSize: 22),
                axis: Axis.horizontal,
                minValue: 1,
                maxValue: 256,
                value: length,
                onChanged: setLength),
            Text(
              "Alphabets count",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            NumberPicker(
                selectedTextStyle: TextStyle(color: Colors.black, fontSize: 22),
                axis: Axis.horizontal,
                minValue: 1,
                maxValue: 10,
                value: alphabetsCount,
                onChanged: setAC),
            Text(
              "Digits Count",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            NumberPicker(
                selectedTextStyle: TextStyle(color: Colors.black, fontSize: 22),
                axis: Axis.horizontal,
                minValue: 1,
                maxValue: 10,
                value: digitsCount,
                onChanged: setDC),
            Text(
              "Special characters count",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            NumberPicker(
                selectedTextStyle: TextStyle(color: Colors.black, fontSize: 22),
                axis: Axis.horizontal,
                minValue: 1,
                maxValue: 10,
                value: specialCharactersCount,
                onChanged: setSCC),
            TextButton(
              child: Text(
                "confirm",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: _pop,
            )
          ])),
    );
  }

  setAC(int val) {
    setState(() {
      alphabetsCount = val;
    });
  }

  setDC(int val) {
    setState(() {
      digitsCount = val;
    });
  }

  setSCC(int val) {
    setState(() {
      specialCharactersCount = val;
    });
  }

  setLength(int val) {
    setState(() {
      length = val;
    });
  }

  Future<bool> _pop() async {
    if (length != specialCharactersCount + alphabetsCount + digitsCount) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          elevation: 600,
          content: Text("all symbols count in sum must be equal to length")));
    } else {
      Settings.length = length;
      Settings.specialCharactersCount = specialCharactersCount;
      Settings.alphabetsCount = alphabetsCount;
      Settings.digitsCount = digitsCount;
      final box = Hive.box<HiveSettingsBox>(SETTINGS_BOX);
      await box.clear();
      box.add(HiveSettingsBox()
        ..alphabetsCount = alphabetsCount
        ..digitsCount = digitsCount
        ..length = length
        ..specialCharactersCount = specialCharactersCount
        ..passwordCount = 1);
      Navigator.of(context).pop();
    }
    return Future.delayed(Duration.zero, () => true);
  }
}
