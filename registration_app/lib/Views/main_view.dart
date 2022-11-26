import 'package:flutter/material.dart';
import 'package:registration_app/Profile/profile.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MainView"),
        
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Username ${Profile().username}"),
            Text("Email ${Profile().email}"),
          ],
        ),
      ),
    );
  }
}
