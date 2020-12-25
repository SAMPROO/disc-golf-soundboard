import 'package:disc_golf_soundboard/services/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Player {
  String id;
  String playerName;
  String playerAvatar;
  int listensCount = 0;

  Player(this.id, this.playerName, this.playerAvatar);

  void incrementListenCount() {
    listensCount += 1;
  }

  Future<Widget> getAvatarImage(BuildContext context, String imageName) async {
    Image image;
    await FirebaseStorageService.loadImage(context, imageName).then((value) {
      image = Image.network(
        value,
        fit: BoxFit.scaleDown,
      );
    });

    return image;
  }
}
