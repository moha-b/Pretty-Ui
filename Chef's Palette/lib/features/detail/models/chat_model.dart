class Chat {
  final String name;
  final String comment;
  final String time;

  Chat(this.name, this.comment, this.time);
}

List<Chat> chatList = [
  Chat("John Doe", "This recipe is amazing!", "now"),
  Chat("Alice Smith", "I tried it and it turned out great.", "40 m"),
  Chat("Michael Johnson", "The flavors are perfectly balanced.", "12 m"),
  Chat("Emily Davis", "I can't wait to make this again!", "1 h"),
];
