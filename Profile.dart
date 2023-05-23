import 'package:first_app/SettingUser.dart';
import 'package:first_app/editUser.dart';
import 'package:first_app/service/api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter with Firebase',
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
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
                  backgroundImage: AssetImage('lib/images/profile.png'),
                ),
                SizedBox(height: 20),
                ShowLastnameBox(hintText: 'Phattharat Arphasiri'),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ข้อมูลส่วนตัว',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditUserPage()),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Email: tankunprabpairee@gmail.com',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'เบอร์มือถือ: 098-7654532',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '_______________________________________________',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ข้อมูลรถ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons
                                    .delete), // หรือสัญลักษณ์ลบอื่นๆ ตามที่คุณต้องการ
                                onPressed: () {
                                  // ทำอะไรสักอย่างเมื่อคลิกปุ่มลบ
                                },
                              ),
                            ],
                          ),
                          Text(
                            'รถ : เก๋ง ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'ToYOTA : Vios',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'ทะเบียนรถ กห 6384',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '_______________________________________________',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              // ทำอะไรสักอย่างเมื่อคลิกปุ่ม "รถคันที่ 1"
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: Colors.white), // กำหนดเส้นขอบสีน้ำเงิน
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // กำหนดรูปร่างปุ่มเป็นรูปสี่เหลี่ยมมุมกลม
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 60,
                                  0), // ปรับตำแหน่งและระยะห่างของ Icon
                              child: Row(
                                children: [
                                  Text(
                                    'รถคันที่ 1',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios, size: 18),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingUserPage()),
                              );
                              // ทำอะไรสักอย่างเมื่อคลิกปุ่ม "ย้อนกลับ"
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue, // กำหนดสีพื้นหลังเป็นสีฟ้า
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 2),
                                ),
                                Text('ย้อนกลับ'),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
