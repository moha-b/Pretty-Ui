import 'package:listenlit/core/utils/utils.dart';

import '../../../core/helper/selectgenreslist.dart';
import 'chapter_model.dart';

class BookModel {
  String bookId;
  String bookName;
  String authorName;
  String readTime;
  String listenTime;
  String bookImage;
  Genres genre;
  String description;
  List<String> tagsList;
  List<ChaptersModel> chaptersList;

  BookModel({
    required this.bookId,
    required this.bookName,
    required this.authorName,
    required this.readTime,
    required this.listenTime,
    required this.bookImage,
    required this.genre,
    required this.description,
    required this.chaptersList,
    required this.tagsList,
  });
}

List<BookModel> bookModelList = [
  BookModel(
    bookName: 'The good guy',
    authorName: 'Mark mcallister',
    readTime: '5',
    listenTime: '8',
    bookImage: AppImagePath.kThegoodguy,
    genre: Genres.Adventure,
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '0',
  ),
  BookModel(
    bookName: 'Futurama',
    authorName: 'Michael Douglas jr.',
    readTime: '19',
    listenTime: '9',
    bookImage: AppImagePath.kFuturism,
    genre: Genres.Fiction,
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '1',
  ),
  BookModel(
    bookName: 'Explore your create mind to positivity',
    authorName: 'Royryan Mercado',
    readTime: '15',
    listenTime: '15',
    bookImage: AppImagePath.kcreative,
    genre: Genres.Fiction,
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '2',
  ),
  BookModel(
    bookName: 'Norse mythology',
    authorName: 'Neil Gaiman',
    readTime: '5',
    listenTime: '8',
    bookImage: AppImagePath.kNorsemythology,
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    genre: Genres.Fiction,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '3',
  ),
  BookModel(
    bookName: 'The good guy',
    authorName: 'Mark mcallister',
    description:
        'A story about a guy who was very good until the very end when every',
    readTime: '5',
    listenTime: '8',
    chaptersList: chaptersList,
    bookImage: AppImagePath.kThegoodguy,
    genre: Genres.Fiction,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '4',
  ),
  BookModel(
    bookName: 'Futurama',
    authorName: 'Michael Douglas jr.',
    description:
        'A story about a guy who was very good until the very end when every',
    readTime: '19',
    listenTime: '9',
    chaptersList: chaptersList,
    bookImage: AppImagePath.kFuturism,
    genre: Genres.Fantasy,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '5',
  ),
  BookModel(
    bookName: 'Explore your create mind to positivity',
    authorName: 'Royryan Mercado',
    readTime: '15',
    listenTime: '15',
    bookImage: AppImagePath.kcreative,
    chaptersList: chaptersList,
    description:
        'A story about a guy who was very good until the very end when every',
    genre: Genres.Poetry,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '6',
  ),
  BookModel(
    bookName: 'Norse mythology',
    authorName: 'Neil Gaiman',
    readTime: '5',
    listenTime: '9',
    bookImage: AppImagePath.kNorsemythology,
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    genre: Genres.Business,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '7',
  ),
  BookModel(
    bookName: 'The good guy',
    authorName: 'Mark mcallister',
    readTime: '5',
    listenTime: '5',
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    bookImage: AppImagePath.kThegoodguy,
    genre: Genres.Autobiography,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '8',
  ),
  BookModel(
    bookName: 'Futurama',
    authorName: 'Michael Douglas jr.',
    readTime: '5',
    listenTime: '5',
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    bookImage: AppImagePath.kFuturism,
    genre: Genres.Childrens_Literature,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '9',
  ),
  BookModel(
    bookName: 'Explore your create mind to positivity',
    authorName: 'Royryan Mercado',
    readTime: '5',
    listenTime: '5',
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    bookImage: AppImagePath.kcreative,
    genre: Genres.Cookbook,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '10',
  ),
  BookModel(
    bookName: 'The good guy',
    authorName: 'Mark mcallister',
    readTime: '5',
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    listenTime: '5',
    bookImage: AppImagePath.kThegoodguy,
    genre: Genres.Crime,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '11',
  ),
  BookModel(
    bookName: 'Futurama',
    authorName: 'Michael Douglas jr.',
    readTime: '5',
    listenTime: '5',
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    bookImage: AppImagePath.kFuturism,
    genre: Genres.Drama,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '12',
  ),
  BookModel(
    bookName: 'Explore your create mind to positivity',
    authorName: 'Royryan Mercado',
    readTime: '5',
    listenTime: '5',
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    bookImage: AppImagePath.kcreative,
    genre: Genres.Future,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '13',
  ),
  BookModel(
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    bookName: 'The good guy',
    authorName: 'Mark mcallister',
    readTime: '5',
    listenTime: '5',
    bookImage: AppImagePath.kThegoodguy,
    genre: Genres.History,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '14',
  ),
  BookModel(
    bookName: 'Futurama',
    authorName: 'Michael Douglas jr.',
    readTime: '5',
    listenTime: '5',
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    bookImage: AppImagePath.kFuturism,
    genre: Genres.Horror,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '15',
  ),
  BookModel(
    bookName: 'Explore your create mind to positivity',
    authorName: 'Royryan Mercado',
    readTime: '5',
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    listenTime: '5',
    bookImage: AppImagePath.kcreative,
    genre: Genres.Humor,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '16',
  ),
  BookModel(
    bookName: 'The good guy',
    authorName: 'Mark mcallister',
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    readTime: '5',
    listenTime: '5',
    bookImage: AppImagePath.kThegoodguy,
    genre: Genres.Mystery,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '17',
  ),
  BookModel(
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    bookName: 'Futurama',
    authorName: 'Michael Douglas jr.',
    readTime: '5',
    listenTime: '5',
    bookImage: AppImagePath.kFuturism,
    genre: Genres.Science,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '18',
  ),
  BookModel(
    bookName: 'Explore your create mind to positivity',
    authorName: 'Royryan Mercado',
    readTime: '5',
    description:
        'A story about a guy who was very good until the very end when every',
    chaptersList: chaptersList,
    listenTime: '5',
    bookImage: AppImagePath.kcreative,
    genre: Genres.Poetry,
    tagsList: [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Mind & Philosophy',
    ],
    bookId: '19',
  ),
];
