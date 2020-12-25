import 'package:disc_golf_soundboard/models/audio.dart';
import 'package:disc_golf_soundboard/models/player.dart';
import 'package:flutter/material.dart';

class AudioCardPlay extends StatefulWidget {
  Player player;
  Audio audioElement;

  AudioCardPlay(this.player, this.audioElement);

  @override
  _AudioCardPlayState createState() => _AudioCardPlayState();
}

class _AudioCardPlayState extends State<AudioCardPlay> {
  double avatarSize = 100;

  void update() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: avatarSize,
        width: avatarSize,
        color: Colors.red,
        child: FittedBox(
            fit: BoxFit.cover,
            child: FutureBuilder(
              future: widget.player
                  .getAvatarImage(context, widget.player.playerAvatar),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(child: snapshot.data);
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    child: CircularProgressIndicator(),
                  );
                }

                return Container();
              },
            )),
      ),
      IconButton(
        onPressed: () {
          widget.audioElement.playAudio(context, update);
          widget.audioElement.incrementListenCount();
          widget.player.incrementListenCount();
        },
        iconSize: avatarSize * 0.5,
        icon: Icon(
          widget.audioElement.playing == false ? Icons.play_arrow : Icons.pause,
          color: Colors.white,
        ),
      )
    ]);
  }
}
