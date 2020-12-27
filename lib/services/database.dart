import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disc_golf_soundboard/models/audio.dart';
import 'package:disc_golf_soundboard/models/player.dart';

class DatabaseService {
  String playerId;
  DatabaseService({this.playerId});

  final CollectionReference audioCollection =
      FirebaseFirestore.instance.collection('audios');

  final CollectionReference playerCollection =
      FirebaseFirestore.instance.collection('players');

  List<Audio> _audioListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((document) {
      return Audio(document.data()['id'], document.data()['audioName'],
          document.data()['audioFile'], document.data()['playerId']);
    }).toList();
  }

  Stream<List<Audio>> get audios {
    return audioCollection.snapshots().map(_audioListFromSnapshot);
  }

  Player _getPlayerDataFromSnapshot(DocumentSnapshot snapshot) {
    return Player(snapshot.data()['id'], snapshot.data()['playerName'],
        snapshot.data()['playerAvatar']);
  }

  Stream<Player> get player {
    return playerCollection
        .doc(playerId)
        .snapshots()
        .map(_getPlayerDataFromSnapshot);
  }
}
