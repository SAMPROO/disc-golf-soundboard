import 'package:audioplayers/audio_cache.dart';

class AudioElement {
  String audioName;
  String audioFile;
  String playerName;
  String playerAvatar;
  bool isFavourite;

  AudioElement({this.audioName, this.audioFile, this.playerName, this.playerAvatar, this.isFavourite});

  void playAudio() {
    AudioCache audioCache = AudioCache();
    audioCache.play(audioFile);
  }
}