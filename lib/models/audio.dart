import 'package:audioplayers/audio_cache.dart';

class Audio {

  String id;
  String audioName;
  String audioFile;
  String playerId;
  int listenCount = 0;
  bool isFavourite = false;

  Audio(this.id, this.audioName, this.audioFile, this.playerId);

  void playAudio() {
    AudioCache audioCache = AudioCache();
    audioCache.play(audioFile);
  }

  void incrementListenCount() {
    listenCount++;
  }

  void clickFavourite() {
    isFavourite = !isFavourite;
  }
}