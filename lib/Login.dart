import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Center(
        child: Text("Demo")
      ),
    );
  }
}