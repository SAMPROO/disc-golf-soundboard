import 'package:audioplayers/audioplayers.dart';
import 'package:disc_golf_soundboard/services/firebase_storage.dart';
import 'package:flutter/material.dart';

class Audio {
  AudioPlayer audioPlayer = AudioPlayer();
  String id;
  String audioName;
  String audioFile;
  String playerId;
  int listenCount = 0;
  bool isFavourite = false;
  bool playing = false;

  Audio(this.id, this.audioName, this.audioFile, this.playerId);

  void playAudio(BuildContext context, Function callback) async {
    FirebaseStorageService.loadFile(context, audioFile).then((value) async {
      if (playing) {
        var result = await audioPlayer.pause();
        if (result == 1) {
          playing = false;
        }
      } else {
        var result = await audioPlayer.play(value);
        if (result == 1) {
          playing = true;
        }
      }

      audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
        if(s == AudioPlayerState.COMPLETED) {
          playing = false;
          callback();
        }
      });

      callback();
    });
  }

  void incrementListenCount() {
    listenCount++;
  }

  void clickFavourite() {
    isFavourite = !isFavourite;
  }
}
