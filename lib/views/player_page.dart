import 'package:disc_golf_soundboard/components/audio_list.dart';
import 'package:disc_golf_soundboard/models/audio_utils.dart';
import 'package:disc_golf_soundboard/models/player.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  final Player player;
  PlayerPage(this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(player.playerName),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 200,
                width: 200,
                color: Colors.red,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('images/${player.playerAvatar}'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${player.playerName}'),
                  Text('Team: Prodigy'),
                  Text('Ranking: 1001'),
                ],
              )
            ],
          ),
          Divider(),
          Expanded(flex: 3, child: AudioList(AudioUtils.getAudiosByPlayerId(player.id))),
        ],
      ),
    );
  }
}
