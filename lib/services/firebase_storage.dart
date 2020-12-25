import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FirebaseStorageService extends ChangeNotifier {
  FirebaseStorageService();
  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child('playerAvatars/$image').getDownloadURL();
  }

  static Future<dynamic> loadAudio(BuildContext context, String audio) async {
    return await FirebaseStorage.instance.ref().child('audios/$audio').getDownloadURL();
  }
}