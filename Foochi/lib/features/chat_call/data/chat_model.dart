import '../../profile/data/user_model.dart';

class ChatModel {
  String id;
  UserModel sender;
  UserModel receiver;
  String message;
  bool isReceiver;
  ChatModel({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.message,
    required this.isReceiver,
  });
}

List<ChatModel> dummyChatList = [
  ChatModel(
    id: '2',
    sender: courierUser,
    receiver: currentUser,
    message: 'Have you moved yet?',
    isReceiver: true,
  ),
  ChatModel(
      id: '1',
      sender: courierUser,
      receiver: currentUser,
      message: 'Yes, Sir!',
      isReceiver: false),
  ChatModel(
      id: '3',
      sender: courierUser,
      receiver: currentUser,
      message: "I'm on my way, please wait",
      isReceiver: false),
  ChatModel(
    id: '4',
    sender: courierUser,
    receiver: currentUser,
    message: 'Great!',
    isReceiver: true,
  ),
  ChatModel(
    id: '5',
    sender: courierUser,
    receiver: currentUser,
    message: "Thanks, I'm hungry",
    isReceiver: true,
  ),
  ChatModel(
      id: '6',
      sender: courierUser,
      receiver: currentUser,
      message: "It's 1.2 km away from you",
      isReceiver: false),
  ChatModel(
      id: '7',
      sender: courierUser,
      receiver: currentUser,
      message: 'Yes, Sir!',
      isReceiver: false),
];
