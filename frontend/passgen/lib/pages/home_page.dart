import 'package:flutter/material.dart';

import '../components/bottom_sheet_component.dart';
import '../components/password_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PasswordComponent(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: IconButton(
        onPressed: () => showModalBottomSheet(
            backgroundColor: Colors.transparent,
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 2,
                minWidth: MediaQuery.of(context).size.width),
            context: context,
            builder: (context) => BottomSheetComponent()),
        icon: Icon(Icons.arrow_upward_outlined),
      ),
    );
  }
}
