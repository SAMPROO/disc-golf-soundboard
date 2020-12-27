import 'package:disc_golf_soundboard/components/AudioCard/audio_card.dart';
import 'package:disc_golf_soundboard/models/audio.dart';
import 'package:disc_golf_soundboard/models/player.dart';
import 'package:disc_golf_soundboard/services/database.dart';
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
    return ListView.builder(
        itemCount: audios.length,
        itemBuilder: (context, index) {
          return StreamBuilder<Player>(
              stream: DatabaseService(playerId: audios[index].playerId).player,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return AudioCard(audios[index], snapshot.data);
                } else {
                  return null;
                }
              });
        });
  }
}
