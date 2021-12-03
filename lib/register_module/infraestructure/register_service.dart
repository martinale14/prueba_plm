import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plm_prueba/register_module/domain/upload_item.dart';

class RegisterService {
  RegisterService._();

  static Future<File?> getImage(bool isCamera) async {
    ImageSource source = ImageSource.gallery;

    if (isCamera) {
      source = ImageSource.camera;
    }

    XFile? pickedFile = await ImagePicker().pickImage(
      imageQuality: 60,
      source: source,
    );
    File? imageFile;
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    return imageFile;
  }

  static Future<bool> uploadData(UploadItem item) async {
    bool status = false;

    try {
      await Dio().post(
        'https://plm.com.co/test/users',
        data: FormData.fromMap(
          {
            'name': item.name,
            'lastname': item.lastname,
            'documentType': item.typeDocument,
            'documentNumber': item.documentNumber,
            'email': item.email,
            'phone': item.phone,
            'birthday': item.birthday,
            'image': await MultipartFile.fromFile(item.image.path),
          },
        ),
      );
      status = true;
    } catch (e) {
      debugPrint(e.toString());
    }

    return status;
  }
}
