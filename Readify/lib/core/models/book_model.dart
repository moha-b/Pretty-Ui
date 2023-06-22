import 'package:readify/core/resources/images.dart';

class Book {
  final String name;
  final String author;
  final String image;
  final String rate;
  final String pages;
  final String price;

  Book(this.name, this.author, this.image, this.rate, this.pages, this.price);
}

List<Book> books = [
  Book("The Layover", "Lacie Waldon", AppImages.book1, "⭐ 4.4", "422",
      "\$ 20.00"),
  Book(
      "Dating Plan", "Sara Desai", AppImages.book2, "⭐ 3.4", "352", "\$ 28.00"),
  Book("The Only Game", "Lacie Waldon", AppImages.book3, "⭐ 4.9", "200",
      "\$ 33.00"),
  Book("Take Bookish", "Kate Bromley", AppImages.book4, "⭐ 3.1", "385",
      "\$ 46.00"),
  Book("Meet in Paradise", "Libby Hubscher", AppImages.book5, "⭐ 2.9", "290",
      "\$ 90.00"),
  Book(
      "From Jump", "Lacie Waldon", AppImages.book6, "⭐ 4.0", "340", "\$ 37.00"),
  Book("The Mix-UP", "Holly McCULLOCH", AppImages.book7, "⭐ 2.4", "560",
      "\$ 42.00"),
  Book("Wait For it", "Jenn McKINLAY", AppImages.book8, "⭐ 5.0", "300",
      "\$ 25.00"),
];
