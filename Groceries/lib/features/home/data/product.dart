class Product {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  late int quantity;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  static void addToCart(Product product) {
    for (Product cartProduct in cartItems) {
      if (cartProduct.id == product.id) {
        cartProduct.quantity = product.quantity;
        return;
      }
    }
    cartItems.add(product);
  }
}

final List<Product> products = [
  Product(
    id: 1,
    title: "Apple IPhone 15",
    description:
        "This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details. The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.",
    imageUrl: "assets/images/0.png",
    price: 8.80,
    quantity: 1,
  ),
  Product(
    id: 2,
    title: "Pasta",
    description:
        "This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details. The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.",
    imageUrl: "assets/images/1.png",
    price: 17.90,
    quantity: 1,
  ),
  Product(
    id: 3,
    title: "Pasta",
    description:
        "This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details. The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.",
    imageUrl: "assets/images/2.png",
    price: 4.00,
    quantity: 1,
  ),
  Product(
    id: 5,
    title: "Pasta",
    description:
        "This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details. The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.",
    imageUrl: "assets/images/3.png",
    price: 3.50,
    quantity: 1,
  ),
  Product(
    id: 6,
    title: "Pasta",
    description:
        "This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details. The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.",
    imageUrl: "assets/images/4.png",
    price: 12.99,
    quantity: 1,
  ),
  Product(
    id: 7,
    title: "Pasta",
    description:
        "This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details. The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.",
    imageUrl: "assets/images/5.png",
    price: 15.00,
    quantity: 1,
  ),
  Product(
    id: 8,
    title: "Pasta",
    description:
        "This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details. The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.",
    imageUrl: "assets/images/6.png",
    price: 7.60,
    quantity: 1,
  ),
  Product(
    id: 9,
    title: "Pasta",
    description:
        "This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details. The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.",
    imageUrl: "assets/images/7.png",
    price: 12.50,
    quantity: 1,
  ),
  Product(
    id: 10,
    title: "Pasta",
    description:
        "This character description generator will generate a fairly random description of a belonging to a random race. However, some aspects of the descriptions will remain the same, this is done to keep the general structure the same, while still randomizing the important details. The generator does take into account which race is randomly picked, and changes some of the details accordingly. For example, if the character is an elf, they will have a higher chance of looking good and clean, they will, of course, have an elvish name, and tend to be related to more elvish related towns and people.",
    imageUrl: "assets/images/8.png",
    price: 9.00,
    quantity: 1,
  ),
];
final List<Product> cartItems = [];
