import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:passgen/constants/hive_box_namings.dart';
import 'package:passgen/utils/settings.dart';
import 'pages/home_page.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveSettingsBoxAdapter());
  await Hive.openBox<HiveSettingsBox>(SETTINGS_BOX);
  Settings.init();
  runApp(const PassGen());
}

class PassGen extends StatelessWidget {
  const PassGen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Space Mono",
          colorScheme: ColorScheme.fromSwatch(primaryColorDark: Colors.black)),
      home: HomePage(),
    );
  }
}
