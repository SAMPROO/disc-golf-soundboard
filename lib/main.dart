import 'package:disc_golf_soundboard/views/home_page.dart';
import 'package:disc_golf_soundboard/views/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
    runApp(App());
}

class App extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
          home: FutureBuilder(
              // Initialize FlutterFire
              future: Firebase.initializeApp(),
              builder: (context, snapshot) {
                  // Check for errors
                  if (snapshot.hasError) {
                      return SomethingWentWrong();
                  }

                  // Once complete, show your application
                  if (snapshot.connectionState == ConnectionState.done) {
                      return HomePage();
                  }

                  // Otherwise, show something whilst waiting for initialization to complete
                  return Loading();
              },
          ),
        );
    }
}

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text('SOMETHING WENT WRONG'),
    );
  }
}
