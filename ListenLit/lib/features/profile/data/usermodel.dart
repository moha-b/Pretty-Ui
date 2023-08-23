import 'package:listenlit/core/utils/utils.dart';
import 'package:listenlit/features/library/data/book_model.dart';
import 'package:listenlit/features/library/data/mylibrary_model.dart';

class UserModel {
  String id;
  String userName;
  String userImage;
  String? email;
  String? dateOfBirth;
  bool isPremium;
  List<String> savedBooks;
  Map<String, BookProgressModel> readingProgress;

  UserModel(
      {required this.id,
      required this.userName,
      required this.userImage,
      this.email,
      this.dateOfBirth,
      this.isPremium = false,
      this.readingProgress = const {},
      this.savedBooks = const []});
}

UserModel currentUser = UserModel(
    id: "9999",
    userName: "FCT",
    userImage: AppImagePath.kProfile,
    readingProgress: Map.fromEntries(
      bookModelList.sublist(5, 10).map(
            (book) => MapEntry(
              book.bookId,
              BookProgressModel(progressPercentage: 15, bookId: book.bookId),
            ),
          ),
    ),
    savedBooks: bookModelList.sublist(0, 5).map((e) => e.bookId).toList());

List<UserModel> userStoryList = [
  UserModel(
    id: '1',
    userName: 'Royryan Merc...',
    userImage: AppImagePath.kRoyryanMercStory,
  ),
  UserModel(
    id: '2',
    userName: 'Neil Gaiman',
    userImage: AppImagePath.kNeilGaimanStory,
  ),
  UserModel(
    id: '3',
    userName: 'Mark mcallister',
    userImage: AppImagePath.kMarkmcallisterpngStory,
  ),
  UserModel(
    id: '4',
    userName: 'Michael Doug...',
    userImage: AppImagePath.kMichaelDougStory,
  ),
  UserModel(
    id: '5',
    userName: 'Royryan Merc...',
    userImage: AppImagePath.kRoyryanMercStory,
  ),
  UserModel(
    id: '6',
    userName: 'Neil Gaiman',
    userImage: AppImagePath.kNeilGaimanStory,
  ),
  UserModel(
    id: '7',
    userName: 'Mark mcallister',
    userImage: AppImagePath.kMarkmcallisterpngStory,
  ),
  UserModel(
    id: '8',
    userName: 'Michael Doug...',
    userImage: AppImagePath.kMichaelDougStory,
  ),
];
