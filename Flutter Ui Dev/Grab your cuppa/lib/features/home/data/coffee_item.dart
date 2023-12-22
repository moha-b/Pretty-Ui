class CoffeeItem {
  final String id;
  final String name;
  final String image;
  final double price;

  CoffeeItem(
      {required this.id,
      required this.name,
      required this.image,
      required this.price});
}

List<CoffeeItem> items = [
  CoffeeItem(
      id: '1',
      name: 'Americano',
      image: 'assets/coffee/GLASS-0.png',
      price: 2.0),
  CoffeeItem(
      id: '5', name: 'Chai', image: 'assets/coffee/GLASS-4.png', price: 6.0),
  CoffeeItem(
      id: '4',
      name: 'Macchiato',
      image: 'assets/coffee/GLASS-3.png',
      price: 5.0),
  CoffeeItem(
      id: '9', name: 'Brew', image: 'assets/coffee/GLASS-8.png', price: 3.0),
  CoffeeItem(
      id: '3', name: 'Caramel', image: 'assets/coffee/GLASS-2.png', price: 4.0),
  CoffeeItem(
      id: '2', name: 'Mocha', image: 'assets/coffee/GLASS-1.png', price: 3.0),
  CoffeeItem(
      id: '6',
      name: 'Cappuccino',
      image: 'assets/coffee/GLASS-5.png',
      price: 7.0),
  CoffeeItem(
      id: '7',
      name: 'Strawberries',
      image: 'assets/coffee/GLASS-6.png',
      price: 8.0),
  CoffeeItem(
      id: '8', name: 'Java', image: 'assets/coffee/GLASS-7.png', price: 2.0),
];
