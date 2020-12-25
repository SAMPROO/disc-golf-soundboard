import 'package:disc_golf_soundboard/models/audio.dart';
import 'package:disc_golf_soundboard/models/player.dart';
import 'package:disc_golf_soundboard/models/player_utils.dart';
import 'package:disc_golf_soundboard/views/player_page.dart';
import 'package:flutter/material.dart';

class AudioCard extends StatefulWidget {
  Audio audioElement;
  Player player;

  AudioCard(Audio audioElement) {
    this.audioElement = audioElement;
    this.player = PlayerUtils.getPlayerById(audioElement.playerId);
  }

  @override
  _AudioCardState createState() => _AudioCardState();
}

class _AudioCardState extends State<AudioCard> {
  final double borderRadius = 10.0;

  void favourite() {
    setState(() {
      widget.audioElement.clickFavourite();
    });
  }

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
        // TODO: Fix text overflow issue
        children: [
          _fileInfo(context, widget.audioElement, widget.player),
          _actionButtons(widget.audioElement, widget.player, context, favourite)
        ],
      ),
    );
  }
}

Widget _fileInfo(BuildContext context, Audio audioElement, Player player) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _avatarComponent(context, audioElement, player),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(audioElement.audioName),
            Text(player.playerName),
          ],
        )
      ],
    ),
  );
}

Widget _avatarComponent(
    BuildContext context, Audio audioElement, Player player) {
  double avatarSize = 100;
  return Stack(alignment: Alignment.center, children: [
    Container(
      height: avatarSize,
      width: avatarSize,
      color: Colors.red,
      child: FittedBox(
          fit: BoxFit.cover,
          child: FutureBuilder(
            future: player.getAvatarImage(context, player.playerAvatar),
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
        iconSize: avatarSize * 0.5,
        icon: Icon(
          Icons.play_arrow,
          color: Colors.white,
        ),
        onPressed: () {
          audioElement.playAudio();
          audioElement.incrementListenCount();
          player.incrementListenCount();
        })
  ]);
}

Widget _actionButtons(Audio audioElement, Player player, BuildContext context,
    Function callback) {
  double iconSize = 30;
  return Container(
    padding: EdgeInsets.only(right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            iconSize: iconSize,
            icon: Icon(
              Icons.star,
            ),
            color: audioElement.isFavourite ? Colors.amberAccent : Colors.black,
            onPressed: () {
              callback();
            }),
        IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: iconSize,
          color: Colors.black,
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlayerPage(player)),
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
    ),
  );
}
