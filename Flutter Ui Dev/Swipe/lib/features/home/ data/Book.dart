class Book {
  final String img;
  final String name;
  final String author;
  final String category;
  Book(
    this.img,
    this.name,
    this.author,
    this.category,
  );
}

class Books {
  List<Book> _bookList = [
    Book("images/1.jpg", "Black Beauty", "Ana Sewell", "Children's Literature"),
    Book("images/2.jpg", "The Hunter", "Lincoln Towney",
        "Biography, Autobiography"),
    Book("images/3.jpg", "Don Qui Xote De La Macha", "Carvantes", "Novel"),
    Book("images/4.jpg", "A Minor fall", "Prince Ainsworth", "Legal story"),
  ];

  get bookList => _bookList;

  set bookList(value) {
    _bookList = value;
  }
}
