import 'package:flutter/material.dart';
import 'package:sky/Databse/usermodel.dart';

class HomePage extends StatefulWidget {
  final UserModel user;   // it is use to get user data login to home page profile

  HomePage({required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showUserInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.blueAccent,

      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(right:200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showUserInfo = !showUserInfo;
                  });
                },
                child: Icon(Icons.menu),
              ),
              if (showUserInfo)
                Column(
                  children: <Widget>[
                    Text('Username: ${widget.user.username}'),
                    Text('Email: ${widget.user.email}'),
                    Text('Mobile No: ${widget.user.mobileNo}'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
