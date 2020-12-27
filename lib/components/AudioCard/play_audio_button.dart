import 'package:disc_golf_soundboard/models/audio.dart';
import 'package:flutter/material.dart';

class PlayAudioButton extends StatefulWidget {
  final Audio audioElement;
  PlayAudioButton(this.audioElement);
  @override
  _PlayAudioButtonState createState() => _PlayAudioButtonState();
}

class _PlayAudioButtonState extends State<PlayAudioButton> {
  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.audioElement.playAudio(context, update);
        //TODO: Increment for databse: widget.audioElement.incrementListenCount();
        //TODO: increment using static player database method: widget.player.incrementListenCount();
      },
      iconSize: 50,
      icon: Icon(
        widget.audioElement.playing == false ? Icons.play_arrow : Icons.pause,
        color: Colors.white,
      ),
    );
  }
}
