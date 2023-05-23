import 'package:first_app/login2.dart';
import 'package:first_app/register2.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.home,
                size: 40,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              ));
            },
          )
        ],
      ),
      body: GestureDetector(
        onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return SignUpPage();
            }),
          );
        },
      ),
    );
  }
}
