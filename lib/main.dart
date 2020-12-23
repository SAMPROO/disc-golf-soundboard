import 'package:disc_golf_soundboard/components/playback_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Column(
        children: [
          PlaybackBar(),
          PlaybackBar(),
          PlaybackBar(),
        ],
      ),
    ));