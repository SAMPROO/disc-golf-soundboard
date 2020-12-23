import 'package:disc_golf_soundboard/components/audio_list.dart';
import 'package:disc_golf_soundboard/models/audio.dart';
import 'package:disc_golf_soundboard/models/player.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Player playerSeppo = Player('seppo_paju', 'Seppo Paju', 'seppo_paju.jpg');
  Player playerPaul = Player('paul_mcbeth', 'Paul McBeth', 'paul_mcbeth.jpg');
  Player playerRicky = Player('ricky_wysocki', 'Ricky Wysocki', 'ricky_wysocki.jpg');

  List<Audio> audioElements = [
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
        body: AudioList(audioElements)
    );
  }
}

