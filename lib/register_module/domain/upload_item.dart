import 'dart:io';

class UploadItem {
  UploadItem({
    required this.name,
    required this.lastname,
    required this.typeDocument,
    required this.documentNumber,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.image,
  });

  String name;
  String lastname;
  String typeDocument;
  String documentNumber;
  String email;
  String phone;
  String birthday;
  File image;
}
