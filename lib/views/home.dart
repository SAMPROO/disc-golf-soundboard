import 'package:disc_golf_soundboard/components/audio_list.dart';
import 'package:disc_golf_soundboard/models/audio.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<Audio> audioElements = [
    Audio('seppo', 'Pönttöön!', 'seppo_paju.mp3', 'seppo_paju'),
    Audio('paul', 'Fart #1', 'paul_mcbeth.mp3', 'paul_mcbeth'),
    Audio('ricky', 'Fart #2', 'ricky_wysocki.mp3', 'ricky_wysocki'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Disc Golf Soundboard'),
          centerTitle: true,
        ),
        body: AudioList(audioElements));
  }
}
