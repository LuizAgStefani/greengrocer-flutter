import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  img: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  img: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  img: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  img: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  img: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  img: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais'
];

// List<CartItemModel> cartItems = [
//   CartItemModel(item: apple, quantity: 1),
//   CartItemModel(item: mango, quantity: 1),
//   CartItemModel(item: guava, quantity: 3),
// ];

UserModel user = UserModel(
  name: 'Luiz Augusto Stefani',
  email: 'luiz.luiz501@gmail.com',
  phone: '11 9 5319-0672',
  cpf: '488.136.758-79',
  password: '',
);

List<OrderModel> orders = [
  // Pedido 01
  // OrderModel(
  //   copyAndPaste: 'q1w2e3r4t5y6',
  //   createdDateTime: DateTime.parse(
  //     '2022-06-08 10:00:10.458',
  //   ),
  //   overdueDateTime: DateTime.parse(
  //     '2022-06-08 11:00:10.458',
  //   ),
  //   id: 'asd6a54da6s2d1',
  //   status: 'pending_payment',
  //   total: 11.0,
  //   itemsCart: [
  //     // CartItemModel(
  //     //   item: apple,
  //     //   quantity: 2,
  //     // ),
  //     // CartItemModel(
  //     //   item: mango,
  //     //   quantity: 2,
  //     // ),
  //   ],
  // ),

  // // Pedido 02
  // OrderModel(
  //   copyAndPaste: 'q1w2e3r4t5y6',
  //   createdDateTime: DateTime.parse(
  //     '2022-06-08 10:30:10.458',
  //   ),
  //   overdueDateTime: DateTime.parse(
  //     '2022-06-08 11:00:10.458',
  //   ),
  //   id: 'a65s4d6a2s1d6a5s',
  //   status: 'refunded',
  //   total: 11.5,
  //   itemsCart: [
  //     // CartItemModel(
  //     //   item: guava,
  //     //   quantity: 1,
  //     // ),
  //   ],
  // ),

  // // Pedido 03
  // OrderModel(
  //   copyAndPaste: '456afqwt',
  //   createdDateTime: DateTime.parse(
  //     '2022-06-08 10:30:10.458',
  //   ),
  //   overdueDateTime: DateTime.parse(
  //     '2022-09-08 11:00:10.458',
  //   ),
  //   id: 'a65s4d6a2s1d6a5s',
  //   status: 'delivered',
  //   total: 11.5,
  //   itemsCart: [
  //     // CartItemModel(
  //     //   item: guava,
  //     //   quantity: 1,
  //     // ),
  //     // CartItemModel(
  //     //   item: apple,
  //     //   quantity: 4,
  //     // ),
  //   ],
  // ),

  // // Pedido 04
  // OrderModel(
  //   copyAndPaste: '456afqwt',
  //   createdDateTime: DateTime.parse(
  //     '2022-06-08 10:30:10.458',
  //   ),
  //   overdueDateTime: DateTime.parse(
  //     '2022-09-08 11:00:10.458',
  //   ),
  //   id: 'a65s4d6a2s1d6a5s',
  //   status: 'pending_payment',
  //   total: 11.5,
  //   itemsCart: [
  //     // CartItemModel(
  //     //   item: guava,
  //     //   quantity: 1,
  //     // ),
  //     // CartItemModel(
  //     //   item: apple,
  //     //   quantity: 4,
  //     // ),
  //   ],
  // ),
];
