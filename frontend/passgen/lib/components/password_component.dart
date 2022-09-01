import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passgen/controllers/password_controller.dart';
import 'package:passgen/models/password_model.dart';

class PasswordComponent extends StatefulWidget {
  const PasswordComponent({super.key});

  @override
  State<PasswordComponent> createState() => _PasswordComponentState();
}

class _PasswordComponentState extends State<PasswordComponent> {
  late Future<Password?> password;
  Color containerColor = Colors.transparent;
  @override
  void initState() {
    password = PasswordController.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Password?>(
      future: password,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            onLongPress: () => _refresh(),
            onTap: copyToClipboard,
            child: AnimatedContainer(
                curve: Curves.easeInOutBack,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.all(8),
                duration: Duration(milliseconds: 250),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      snapshot.data!.password,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Icon(Icons.copy_all)
                  ],
                )),
          );
        }
        return CircularProgressIndicator(
          color: Colors.black,
        );
      },
    );
  }

  void copyToClipboard() {
    Future.microtask(() => password).then((value) {
      Clipboard.setData(
          ClipboardData(text: value == null ? "" : value.password));
      setState(() {
        containerColor = Colors.green[200]!;
      });
      Future.delayed(Duration(seconds: 1),
          () => setState((() => containerColor = Colors.transparent)));
    });
  }

  _refresh() {
    setState(() {
      password = PasswordController.get();
    });
  }
}
