class Player {
  String id;
  String playerName;
  String playerAvatar;
  int listensCount = 0;

  Player(this.id, this.playerName, this.playerAvatar);

  void incrementListenCount() {
    listensCount += 1;
  }
}

