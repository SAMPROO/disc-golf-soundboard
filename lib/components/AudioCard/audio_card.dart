import 'package:disc_golf_soundboard/components/AudioCard/audio_card_action_buttons.dart';
import 'package:disc_golf_soundboard/components/AudioCard/audio_card_avatar.dart';
import 'package:disc_golf_soundboard/components/AudioCard/play_audio_button.dart';
import 'package:disc_golf_soundboard/models/audio.dart';
import 'package:disc_golf_soundboard/models/player.dart';
import 'package:flutter/material.dart';

class AudioCard extends StatefulWidget {
  final Audio audioElement;
  final Player player;

  AudioCard(this.audioElement, this.player);

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
        children: [
          //TODO: If audio or player is null ->
          _fileData(widget.audioElement, widget.player),
          AudioCardActionButtons(widget.audioElement, widget.player)
        ],
      ),
    );
  }
}

Widget _fileData(Audio audioElement, Player player) {
  return Row(
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
          // TODO: Fix text overflow issue
          Text(audioElement.audioName),
          Text(player.playerName),
        ],
      )
    ],
  );
}
