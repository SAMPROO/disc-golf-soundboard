import 'package:disc_golf_soundboard/components/AudioCard/audio_card.dart';
import 'package:disc_golf_soundboard/models/audio.dart';
import 'package:disc_golf_soundboard/models/player.dart';
import 'package:disc_golf_soundboard/services/database.dart';
import 'package:disc_golf_soundboard/views/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AudioList extends StatefulWidget {
  @override
  _AudioListState createState() => _AudioListState();
}

class _AudioListState extends State<AudioList> {
  @override
  Widget build(BuildContext context) {
    final audios = Provider.of<List<Audio>>(context);
    if (audios != null) {
      return ListView.builder(
          itemCount: audios.length,
          itemBuilder: (context, index) {
            return StreamBuilder<Player>(
                stream:
                    DatabaseService(playerId: audios[index].playerId).player,
                builder: (context, snapshot) {
                  return (snapshot.hasData)
                      ? AudioCard(audios[index], snapshot.data)
                      : Card();
                });
          });
    } else {
      return Loading();
    }
  }
}
