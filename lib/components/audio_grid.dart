import 'package:disc_golf_soundboard/components/AudioCard/audio_card_avatar.dart';
import 'package:disc_golf_soundboard/components/AudioCard/play_audio_button.dart';
import 'package:disc_golf_soundboard/models/audio.dart';
import 'package:disc_golf_soundboard/models/player.dart';
import 'package:disc_golf_soundboard/services/database.dart';
import 'package:disc_golf_soundboard/views/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AudioGrid extends StatefulWidget {
  @override
  _AudioGridState createState() => _AudioGridState();
}

class _AudioGridState extends State<AudioGrid> {
  @override
  Widget build(BuildContext context) {
    final audios = Provider.of<List<Audio>>(context);
    if (audios != null) {
      return GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(5),
          children: List.generate(audios.length, (index) {
            return StreamBuilder<Player>(
                stream:
                    DatabaseService(playerId: audios[index].playerId).player,
                builder: (context, snapshot) {
                  return (snapshot.hasData)
                      ? Stack(alignment: Alignment.center, children: [
                          AudioCardAvatar(snapshot.data),
                          PlayAudioButton(audios[index])
                        ])
                      : Card();
                });
          }));
    } else {
      return Loading();
    }
  }
}
