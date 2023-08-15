class ChatModel {
  String id;
  DateTime messageTime;
  bool isSender;
  String message;

  ChatModel({
    required this.id,
    required this.messageTime,
    required this.isSender,
    required this.message,
  });
}

List<ChatModel> dummyChats = [
  ChatModel(
    id: '1',
    messageTime: DateTime.now().subtract(const Duration(hours: 1)),
    isSender: true,
    message: 'Hello, thank you for visiting DoorHub. How can we help you? ',
  ),
  ChatModel(
    id: '2',
    messageTime: DateTime.now().subtract(const Duration(minutes: 45)),
    isSender: false,
    message:
        ' Hello, I have purchased the UI kit. I need help about the others service. I want to add more features.',
  ),
  ChatModel(
    id: '3',
    messageTime: DateTime.now().subtract(const Duration(minutes: 30)),
    isSender: true,
    message:
        'We are glad that you have purchased our kit. Which features you would like to add? ',
  ),
  ChatModel(
    id: '4',
    messageTime: DateTime.now().subtract(const Duration(minutes: 15)),
    isSender: false,
    message:
        'Thank you so much for your quick response. Please take a look on this link.  https://ui8.net/product-link',
  ),
];
