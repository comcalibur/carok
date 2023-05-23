import 'package:first_app/login2.dart';
import 'package:flutter/material.dart';
import './database.dart';
import '../register2.dart';

final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _newpasswordController = TextEditingController();
final TextEditingController _confirmpasswordController =
    TextEditingController();
final TextEditingController _lockusernameController = TextEditingController();
final TextEditingController _firstnameController = TextEditingController();
final TextEditingController _lastnameController = TextEditingController();
final TextEditingController _phonenumberController = TextEditingController();
final TextEditingController _showlastnameboxController =
    TextEditingController();
final TextEditingController _editnameboxController = TextEditingController();

Database database = Database();
late final String username;
late final String password;
late final String firstName;
late final String lastName;
late final String phoneNumber;
late final String showlastnamebox;
late final String editnamebox;

class UsernameBox extends StatefulWidget {
  final String hintText;
  UsernameBox({Key? key, required this.hintText}) : super(key: key);
  @override
  _UsernameBox createState() => _UsernameBox();
}

class _UsernameBox extends State<UsernameBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _usernameController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        labelText: 'Username',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: Icon(Icons.person),
      ),
    );
  }
}

class PasswordBox extends StatefulWidget {
  final String hintText;
  PasswordBox({Key? key, required this.hintText}) : super(key: key);
  @override
  _PasswordBox createState() => _PasswordBox();
}

class _PasswordBox extends State<PasswordBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        labelText: 'Password',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }
}

class LoginBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)))),
      onPressed: () async {
        if (_usernameController.text.isEmpty ||
            _passwordController.text.isEmpty) {
          // แสดงข้อความเตือนเมื่อช่อง username หรือ password ว่างเปล่า
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          // เรียกใช้งานฟังก์ชัน login และรับค่าผลลัพธ์
          bool success = await database.login(
              _usernameController.text, _passwordController.text);
          if (success) {
            // สร้างหน้าที่จะไปหลังจาก Login สำเร็จ
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          } else {
            // แสดงข้อความเตือนเมื่อ Login ไม่สำเร็จ
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('ชื่อผู้ใช้หรือรหัสผ่านผิด'),
                duration: Duration(seconds: 3),
              ),
            );
          }
        }
      },
      child: Text('Login'),
    );
  }
}

class FirstnameBox extends StatefulWidget {
  final String hintText;
  FirstnameBox({Key? key, required this.hintText}) : super(key: key);
  @override
  _FirstnameBox createState() => _FirstnameBox();
}

class _FirstnameBox extends State<FirstnameBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _firstnameController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        labelText: 'ชื่อจริง',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

class LastnameBox extends StatefulWidget {
  final String hintText;
  LastnameBox({Key? key, required this.hintText}) : super(key: key);
  @override
  _LastnameBox createState() => _LastnameBox();
}

class _LastnameBox extends State<LastnameBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _lastnameController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        labelText: 'นามสกุล',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

class PhoneBox extends StatefulWidget {
  final String hintText;
  PhoneBox({Key? key, required this.hintText}) : super(key: key);
  @override
  _PhoneBox createState() => _PhoneBox();
}

class _PhoneBox extends State<PhoneBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _phonenumberController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        labelText: 'เบอร์โทรศัพท์',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: Icon(Icons.phone),
      ),
    );
  }
}

class SignupBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_usernameController.text.isEmpty ||
            _passwordController.text.isEmpty ||
            _firstnameController.text.isEmpty ||
            _lastnameController.text.isEmpty ||
            _phonenumberController.text.isEmpty) {
          // แสดงข้อความเตือนเมื่อช่อง username หรือ password ว่างเปล่า
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          // เรียกใช้งานฟังก์ชัน login และรับค่าผลลัพธ์
          bool success =
              await database.isUsernameDuplicate(_usernameController.text);
          if (success) {
            // สร้างหน้าที่จะไปหลังจาก Login สำเร็จ
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('๊Username นี้มีผู้ใช้งานแล้ว'),
                duration: Duration(seconds: 3),
              ),
            );
          } else {
            // แสดงข้อความเตือนเมื่อ Login ไม่สำเร็จ
            addUserToFirestore(
                _usernameController.text,
                _passwordController.text,
                _firstnameController.text,
                _lastnameController.text,
                _phonenumberController.text);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          }
        }
      },
      child: Text('Submit'),
    );
  }
}

class ForgotpasswordBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_phonenumberController.text.isEmpty ||
            _usernameController.text.isEmpty) {
          // แสดงข้อความเตือนเมื่อช่อง username หรือ phonenumber ว่างเปล่า
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          Future<bool> success = checkuserphone(
              _phonenumberController.text, _usernameController.text);
          if (await success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('ระบบกำลังส่งข้อความไปยังเบอร์โทรศัพท์ของคุณ'),
                duration: Duration(seconds: 3),
              ),
            );

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('ไม่พบบัญชีผู้ใช้งาน'),
                duration: Duration(seconds: 3),
              ),
            );
          }
        }
      },
      child: Text('Submit'),
    );
  }
}

class ChangepasswordBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_newpasswordController.text.isEmpty ||
            _confirmpasswordController.text.isEmpty) {
          // แสดงข้อความเตือนเมื่อช่อง username หรือ phonenumber ว่างเปล่า
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('กรุณากรอก Password ใหม่'),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          Future<bool> success = checkpassword(
              _lockusernameController as String, _newpasswordController.text);
          if (await success) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('รหัสผ่่านนี้ถูกใช้ก่อนหน้าแล้ว'),
                duration: Duration(seconds: 3),
              ),
            );
          }
        }
      },
      child: Text('Submit'),
    );
  }
}

class NewPasswordBox extends StatefulWidget {
  final String hintText;
  NewPasswordBox({Key? key, required this.hintText}) : super(key: key);
  @override
  _NewPasswordBox createState() => _NewPasswordBox();
}

class _NewPasswordBox extends State<NewPasswordBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _newpasswordController,
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        labelText: 'Newpassword',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: Icon(Icons.key),
      ),
    );
  }
}

class ConfirmPasswordBox extends StatefulWidget {
  final String hintText;
  ConfirmPasswordBox({Key? key, required this.hintText}) : super(key: key);
  @override
  _ConfirmPasswordBox createState() => _ConfirmPasswordBox();
}

class _ConfirmPasswordBox extends State<ConfirmPasswordBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _confirmpasswordController,
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        labelText: 'ConfirmPassword',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: Icon(Icons.key),
      ),
    );
  }
}

class LockUsernameBox extends StatefulWidget {
  final String hintText;
  LockUsernameBox({Key? key, required this.hintText}) : super(key: key);
  @override
  _LockUsernameBox createState() => _LockUsernameBox();
}

class _LockUsernameBox extends State<LockUsernameBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _lockusernameController,
      enabled: false, // เพิ่ม property นี้เพื่อกำหนดให้ช่องนี้ไม่สามารถแก้ไขได้
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        labelText: 'Username',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: Icon(Icons.person),
      ),
    );
  }
}

class ShowLastnameBox extends StatefulWidget {
  final String hintText;
  ShowLastnameBox({Key? key, required this.hintText}) : super(key: key);
  @override
  _ShowLastnameBoxState createState() => _ShowLastnameBoxState();
}

class _ShowLastnameBoxState extends State<ShowLastnameBox> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: _showlastnameboxController,
        enabled: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          labelText: 'Phattharat Arphasiri',
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.blue, width: 1.0),
          ),
        ),
      ),
    );
  }
}

class EditnameBox extends StatefulWidget {
  final String hintText;
  final bool enabled;

  EditnameBox({Key? key, required this.hintText, this.enabled = false})
      : super(key: key);

  @override
  _EditnameBoxState createState() => _EditnameBoxState();
}

class _EditnameBoxState extends State<EditnameBox> {
  TextEditingController _editnameboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _editnameboxController.text = widget.hintText;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: _editnameboxController,
        enabled: widget.enabled,
        style: TextStyle(
          fontWeight: FontWeight.bold, // กำหนดตัวอักษรตัวหนา
          fontSize: 18, // กำหนดขนาดตัวอักษร
          color: Colors.black, // กำหนดสีตัวอักษร
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          labelText: ' Phattharat Arphasiri',
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.blue, width: 1.0),
          ),
        ),
      ),
    );
  }
}
