import 'package:disc_golf_soundboard/models/player.dart';
import 'package:flutter/material.dart';

class AudioCardAvatar extends StatelessWidget {
  final Player player;
  AudioCardAvatar(this.player);

  @override
  Widget build(BuildContext context) {
    double avatarSize = 300;
    return Container(
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
    );
  }
}
