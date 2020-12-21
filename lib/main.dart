import 'package:disc_golf_soundboard/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
      },
    ));


