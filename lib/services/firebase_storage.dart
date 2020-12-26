import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FirebaseStorageService extends ChangeNotifier {
  FirebaseStorageService();
  static Future<dynamic> loadFile(BuildContext context, String file) async {
    return await FirebaseStorage.instance.ref().child(file).getDownloadURL();
  }
}