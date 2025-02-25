import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() {
    return ListScreenState();
  }
}

class ListScreenState extends State<ListScreen> {
  bool _isAppbar = true;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        appBarStatus(false);
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        appBarStatus(true);
      }
    });
  }

  void appBarStatus(bool status) {
    setState(() {
      print(status);
      _isAppbar = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
    child: AnimatedContainer(
    height: _isAppbar ? 55.0 : 0.0,
    duration: Duration(milliseconds: 200),
    child: Text("data"),
    ),
      ),
      ),
      body: ListView.builder(
        controller: _scrollController,
          itemCount: 100,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Text(index.toString()),
              onTap: () {
                Navigator.pop(context, "Hello from Second Screen!");
              },
            );
          }),
    );
  }
}