import 'package:first_app/service/api.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter with Firebase',
      home: EditUserPage(),
    );
  }
}

class EditUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/images/background_login.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.darken),
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage('lib/images/profile.png'),
                          ),
                          SizedBox(height: 20),
                          EditnameBox(hintText: '', enabled: true),
                          Container(
                              padding: EdgeInsets.all(20),
                              child: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'ข้อมูลส่วนตัว',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Email: ',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          initialValue: '',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                          onChanged: (value) {
                                            // Handle the changed value
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'กรุณากรอกEmailของคุณ',
                                          ),
                                        ),
                                        Text(
                                          'เบอร์มือถือ: ',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          initialValue: '',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                          onChanged: (value) {
                                            // Handle the changed value
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'กรุณากรอกเบอร์มือถือ',
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProfilePage()),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.blue,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 2),
                                                      child: Icon(
                                                          Icons.arrow_back),
                                                    ),
                                                    Text('ย้อนกลับ'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  // ทำอะไรสักอย่างเมื่อคลิกปุ่ม "ยืนยัน"
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.green,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 2),
                                                      child: Icon(Icons.check),
                                                    ),
                                                    Text('ยืนยัน'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ])))
                        ])))));
  }
}
