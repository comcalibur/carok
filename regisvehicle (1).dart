import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterVehiclePage extends StatefulWidget {
  @override
  _RegisterVehiclePageState createState() => _RegisterVehiclePageState();
}

class _RegisterVehiclePageState extends State<RegisterVehiclePage> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  List<String> _vehicleTypes = [
    'รถกระบะ',
    'รถเก๋ง',
    'รถตู้',
    'รถอื่น ๆ',
  ];
  Map<String, bool> _vehicleTypeValues = {
    'รถกระบะ': false,
    'รถเก๋ง': false,
    'รถตู้': false,
    'รถอื่น ๆ': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ลงทะเบียนรถ'),
        backgroundColor: Colors.grey[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(100),
              ),
              child: _image == null
                  ? Center(child: Text('เลือกรูปภาพ'))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getImage,
              child: Text('เลือกรูปภาพ'),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _vehicleTypes.map((type) {
                  return Row(
                    children: [
                      Checkbox(
                        value: _vehicleTypeValues[type],
                        onChanged: (value) {
                          setState(() {
                            _vehicleTypeValues[type] = value!;
                          });
                        },
                      ),
                      Text(type),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
