import 'package:disc_golf_soundboard/components/audio_card.dart';
import 'package:disc_golf_soundboard/models/audio.dart';
import 'package:flutter/material.dart';

class AudioList extends StatefulWidget {
  List<Audio> listItems = [];
  AudioList(this.listItems);

  @override
  _AudioListState createState() => _AudioListState();
}

class _AudioListState extends State<AudioList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listItems.length,
        itemBuilder: (context, index) {
          return AudioCard(widget.listItems[index]);
        });
  }
}