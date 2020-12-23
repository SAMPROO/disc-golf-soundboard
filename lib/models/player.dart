class Player {
  String id;
  String playerName;
  String playerAvatar;
  int listensCount;

  Player(this.id, this.playerName, this.playerAvatar);

  void incrementListenCount() {
    listensCount++;
  }
}

