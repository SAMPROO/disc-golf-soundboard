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
                  child:  FutureBuilder(
                    future: player.getAvatarImage(context, player.playerAvatar),
                    builder: (context, snapshot) {
                      print(snapshot);
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                            height: MediaQuery.of(context).size.height / 1.25,
                            width: MediaQuery.of(context).size.width / 1.25,
                            child: snapshot.data);
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return Container();
                    },
                  ),
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
          //Expanded(flex: 3, child: AudioList(AudioUtils.getAudiosByPlayerId(player.id))),
        ],
      ),
    );
  }
}
