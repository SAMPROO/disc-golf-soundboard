import 'package:audioplayers/audio_cache.dart';

class AudioElement {

  String audioName;
  String audioFile;
  String playerName;
  String playerAvatar;
  int listenedCount = 0;
  bool isFavourite = false;

  AudioElement({this.audioName, this.audioFile, this.playerName, this.playerAvatar, this.isFavourite});

  void playAudio() {
    AudioCache audioCache = AudioCache();
    audioCache.play(audioFile);
  }

  void incrementListenedCount() {
    listenedCount++;
  }

  void favourite() {
    isFavourite = !isFavourite;
  }
}