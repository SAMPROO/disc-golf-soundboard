import 'package:disc_golf_soundboard/components/audio_card.dart';
import 'package:disc_golf_soundboard/models/audio_element.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<AudioElement> audioElements = [
    AudioElement(audioName: 'Noniin!', audioFile: 'seppo_paju.mp3', playerName: 'Seppo Paju', playerAvatar: 'seppo_paju.jpg', isFavourite: false),
    AudioElement(audioName: 'I am the best', audioFile: 'paul_mcbeth.mp3', playerName: 'Paul McBeth', playerAvatar: 'paul_mcbeth.jpg', isFavourite: true),
    AudioElement(audioName: 'They call me Ticky Ricky', audioFile: 'ricky_wysocki.mp3', playerName: 'Ricky Wysocki', playerAvatar: 'ricky_wysocki.jpg', isFavourite: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Disc Golf Soundboard'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: audioElements.length,
          itemBuilder: (context, index) {
            return AudioCard(
              audioElement: audioElements[index],
            );
          }));
  }
}