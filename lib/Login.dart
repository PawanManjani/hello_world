import 'package:flutter/material.dart';
import 'package:helloworld/ListScreen.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  FocusNode myFocusNodeEmail = FocusNode();
  FocusNode myFocusPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 65),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(22),
                topLeft: Radius.circular(22),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              createIconView(),
              IconButton(onPressed: () {
                  _navigateAndGetData();
              }, icon: Icon(Icons.list))
            ]),
          ),
        ));
  }

  Widget createIconView() {
    return const SizedBox(
      width: 100,
      height: 100,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Icon(Icons.ac_unit_sharp),
      ),
    );
  }

  void _navigateAndGetData() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListScreen()),
    );
    if (result != null) {
      setState(() {
        print(result);
      });
    }
  }
}

class MyCustomTextField extends StatelessWidget {
  final FocusNode focusNode;
  final String hintText;

  MyCustomTextField(
      {super.key, required this.focusNode, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: hintText),
    );
  }
}
