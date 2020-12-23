import 'package:disc_golf_soundboard/models/audio_element.dart';
import 'package:flutter/material.dart';

class AudioCard extends StatefulWidget {

  AudioElement audioElement;
  AudioCard({this.audioElement});

  @override
  _AudioCardState createState() => _AudioCardState();
}

class _AudioCardState extends State<AudioCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[150],
      child: ListTile(
        leading: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/${widget.audioElement.playerAvatar}'),
            ),
            IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white,),
                onPressed: () {
                  widget.audioElement.playAudio();
                })
          ],
        ),
        title: Text('"${widget.audioElement.audioName}"'),
        subtitle: Text(widget.audioElement.playerName),
        trailing: Icon(Icons.star),
      ),
    );
  }
}