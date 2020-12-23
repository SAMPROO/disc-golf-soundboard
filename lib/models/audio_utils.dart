import 'package:disc_golf_soundboard/models/audio.dart';

class AudioUtils {
  static List<Audio> getAudiosByPlayerId(String id) {
    //TODO: Search audio elements by player id from database
    List<Audio> temp = [
      Audio('seppo1', 'Pönttöön!', 'seppo_paju.mp3', 'seppo_paju'),
      Audio('seppo2', 'Noniin!', 'paul_mcbeth.mp3', 'seppo_paju'),
      Audio('seppo3', 'CAMOUUN!', 'ricky_wysocki.mp3', 'seppo_paju'),
      Audio('seppo3', 'CAMOUUN!', 'ricky_wysocki.mp3', 'seppo_paju'),
      Audio('seppo3', 'CAMOUUN!', 'ricky_wysocki.mp3', 'seppo_paju'),
      Audio('seppo3', 'CAMOUUN!', 'ricky_wysocki.mp3', 'seppo_paju'),
      Audio('seppo3', 'CAMOUUN!', 'ricky_wysocki.mp3', 'seppo_paju'),
      Audio('seppo3', 'CAMOUUN!', 'ricky_wysocki.mp3', 'seppo_paju'),
      Audio('seppo3', 'CAMOUUN!', 'ricky_wysocki.mp3', 'seppo_paju'),
      Audio('seppo3', 'CAMOUUN!', 'ricky_wysocki.mp3', 'seppo_paju'),
      Audio('seppo3', 'CAMOUUN!', 'ricky_wysocki.mp3', 'seppo_paju'),
      Audio('seppo3', 'CAMOUUN!', 'ricky_wysocki.mp3', 'seppo_paju'),
    ];

    return temp;
  }
}