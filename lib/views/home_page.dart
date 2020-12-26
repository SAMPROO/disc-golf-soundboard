import 'package:disc_golf_soundboard/components/audio_list.dart';
import 'package:disc_golf_soundboard/models/audio.dart';
import 'package:disc_golf_soundboard/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Audio>>.value(
      value: DatabaseService().audios,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Disc Golf Soundboard'),
            centerTitle: true,
          ),
          body: AudioList()),
    );
  }
}
