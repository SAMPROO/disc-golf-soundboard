import 'package:disc_golf_soundboard/models/player.dart';

class PlayerUtils {
  static Player getPlayerById(String id) {
  //TODO: get player from database
    Player playerSeppo = Player('seppo_paju', 'Seppo Paju', 'seppo_paju.jpg');
    return playerSeppo;
  }
}