import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> login(String username, String password) async {
    try {
      var snapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      if (snapshot.docs.isEmpty ||
          snapshot.docs[0].data()['password'] != password) {
        return false;
      }

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> isUsernameDuplicate(String username) async {
    try {
      var snapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      if (snapshot.docs.isEmpty) {
        return false;
      }
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}

// Function สำหรับเพิ่มข้อมูลผู้ใช้ใหม่ลงใน Firestore
Future<void> addUserToFirestore(String username, String password,
    String firstname, String lastname, String phonenumber) async {
  await FirebaseFirestore.instance.collection('users').add({
    'username': username,
    'password': password,
    'firstname': firstname,
    'lastname': lastname,
    'phonenumber': phonenumber
  });
}

Future<bool> checkuserphone(String phonenumber, String username) async {
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .where('phonenumber', isEqualTo: phonenumber)
        .get();
    if (snapshot.docs[0].data()['username'] != username ||
        snapshot.docs[0].data()['phonenumber'] != phonenumber) {
      return false;
    }
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> checkpassword(String username, String password) async {
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .where('password', isEqualTo: password)
        .get();
    if (snapshot.docs[0].data()['username'] != username ||
        snapshot.docs[0].data()['password'] != password) {
      return false;
    }
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<void> updateUserPassword(
    String username, String oldPassword, String newPassword) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('username', isEqualTo: username)
      .where('password', isEqualTo: oldPassword)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    // พบผู้ใช้งานที่ต้องการเปลี่ยน password
    String documentId = querySnapshot.docs[0].id;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(documentId)
        .update({'password': newPassword});
  }
}
