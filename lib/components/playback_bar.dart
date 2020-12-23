import 'package:disc_golf_soundboard/models/audio_element.dart';
import 'package:flutter/material.dart';

class PlaybackBar extends StatefulWidget {
  AudioElement audioElement;
  PlaybackBar({this.audioElement});

  @override
  _PlaybackBarState createState() => _PlaybackBarState();
}

class _PlaybackBarState extends State<PlaybackBar> {

  final double borderRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.grey[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_fileInfo(widget.audioElement),_actionButtons()],
      ),
    );
  }
}

Widget _fileInfo(AudioElement audioElement) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _avatarComponent(audioElement),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(audioElement.audioName),
            Text(audioElement.playerName),
          ],
        )],
    ),
  );
}

Widget _avatarComponent(AudioElement audioElement) {
  double avatarSize = 100;
  return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: avatarSize,
          width: avatarSize,
          color: Colors.red,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
                'images/${audioElement.playerAvatar}'),
          ),
        ),
        IconButton(
            iconSize: avatarSize * 0.5,
            icon: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: () {
              audioElement.playAudio();
            })
      ]
  );
}

Widget _actionButtons() {
  double iconSize = 30;
  return Container(
    padding: EdgeInsets.only(right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.star,
          size: iconSize,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.account_circle,
          size: iconSize,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.share,
          size: iconSize,
        ),
      ],
    ),
  );
}