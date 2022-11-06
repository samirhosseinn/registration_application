import 'package:flutter/material.dart';

class ConfrimEmailView extends StatefulWidget {
  const ConfrimEmailView({Key? key}) : super(key: key);

  @override
  State<ConfrimEmailView> createState() => _ConfrimEmailViewState();
}

class _ConfrimEmailViewState extends State<ConfrimEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ConfrimEmailView"),
      ),
    );
  }
}
