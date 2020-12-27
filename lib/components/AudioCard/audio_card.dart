import 'package:disc_golf_soundboard/components/AudioCard/audio_card_avatar.dart';
import 'package:disc_golf_soundboard/components/AudioCard/play_audio_button.dart';
import 'package:disc_golf_soundboard/models/audio.dart';
import 'package:disc_golf_soundboard/models/player.dart';
import 'package:disc_golf_soundboard/services/database.dart';
import 'package:disc_golf_soundboard/views/player_page.dart';
import 'package:flutter/material.dart';

class AudioCard extends StatefulWidget {
  final Audio audioElement;
  Player player;

  AudioCard(this.audioElement);

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
          //TODO: If audio or player is null ->
          StreamBuilder<Player>(
              stream: DatabaseService(playerId: widget.audioElement.playerId)
                  .player,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _fileInfo(widget.audioElement, snapshot.data);
                }
                return _fileInfo(widget.audioElement,
                    Player("id", "playerName", "playerAvatar"));
              }),
          _actionButtons(widget.audioElement, widget.player, context, favourite)
        ],
      ),
    );
  }
}

Widget _fileInfo(Audio audioElement, Player player) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
            alignment: Alignment.center,
            children: [AudioCardAvatar(player), PlayAudioButton(audioElement)]),
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
