import 'package:disc_golf_soundboard/models/audio.dart';
import 'package:disc_golf_soundboard/models/player.dart';
import 'package:disc_golf_soundboard/views/player_page.dart';
import 'package:flutter/material.dart';

class AudioCardActionButtons extends StatefulWidget {
  final Audio audioElement;
  final Player player;
  AudioCardActionButtons(this.audioElement, this.player);
  @override
  _AudioCardActionButtonsState createState() => _AudioCardActionButtonsState();
}

class _AudioCardActionButtonsState extends State<AudioCardActionButtons> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 30;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            iconSize: iconSize,
            icon: Icon(
              Icons.star,
            ),
            color: widget.audioElement.isFavourite
                ? Colors.amberAccent
                : Colors.black,
            onPressed: () {
              setState(() {
                widget.audioElement.clickFavourite();
              });
            }),
        IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: iconSize,
          color: Colors.black,
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlayerPage(widget.player)),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.share),
          iconSize: iconSize,
          color: Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }
}
