import 'package:audioplayers/audio_cache.dart';
import 'package:disc_golf_soundboard/audio/audio_element.dart';
import 'package:flutter/material.dart';

class AudioCard extends StatelessWidget {

  AudioElement audioElement;
  AudioCard({this.audioElement});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[150],
      child: ListTile(
        leading: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/${audioElement.playerAvatar}'),
            ),
            IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white,),
                onPressed: () {
                  audioElement.playAudio();
                })
          ],
        ),
        title: Text('"${audioElement.audioName}"'),
        subtitle: Text(audioElement.playerName),
        trailing: Icon(Icons.star),
      ),
    );
  }
}