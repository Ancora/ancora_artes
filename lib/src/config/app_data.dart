import 'package:ancora_artes/src/models/cart_item_model.dart';
import 'package:ancora_artes/src/models/item_model.dart';
import 'package:ancora_artes/src/models/order_model.dart';
import 'package:ancora_artes/src/models/user_model.dart';

ItemModel wallClock01 = ItemModel(
  code: 'P00001',
  itemName: 'Relógio Azul sdjasdfjlsdlsd  iíklmlm',
  imgUrl: 'assets/wall_clocks/P00001.jpg',
  unit: 'un',
  price: 90.00,
  description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque orci dolor, lacinia ac facilisis sit amet, molestie nec urna. Curabitur id felis libero. Nullam luctus fringilla metus. Quisque eu tortor vel quam faucibus feugiat. Proin vitae odio massa. Sed fermentum nibh a ligula blandit suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ac faucibus magna. Aliquam ultricies metus arcu, ut vestibulum ipsum volutpat vitae.',
);

ItemModel wallClock02 = ItemModel(
  code: 'P00002',
  itemName: 'Relógio Azul 8474747474',
  imgUrl: 'assets/wall_clocks/P00002.jpg',
  unit: 'un',
  price: 70.00,
  description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque orci dolor, lacinia ac facilisis sit amet, molestie nec urna. Curabitur id felis libero. Nullam luctus fringilla metus. Quisque eu tortor vel quam faucibus feugiat. Proin vitae odio massa. Sed fermentum nibh a ligula blandit suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ac faucibus magna. Aliquam ultricies metus arcu, ut vestibulum ipsum volutpat vitae.',
);

ItemModel wallClock03 = ItemModel(
  code: 'P00003',
  itemName: 'Relógio Azul 7jegsdidje7',
  imgUrl: 'assets/wall_clocks/P00003.jpg',
  unit: 'un',
  price: 105.00,
  description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque orci dolor, lacinia ac facilisis sit amet, molestie nec urna. Curabitur id felis libero. Nullam luctus fringilla metus. Quisque eu tortor vel quam faucibus feugiat. Proin vitae odio massa. Sed fermentum nibh a ligula blandit suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ac faucibus magna. Aliquam ultricies metus arcu, ut vestibulum ipsum volutpat vitae.',
);

ItemModel wallClock04 = ItemModel(
  code: 'P00004',
  itemName: 'Relógio Azul',
  imgUrl: 'assets/wall_clocks/P00004.jpg',
  unit: 'un',
  price: 49.00,
  description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque orci dolor, lacinia ac facilisis sit amet, molestie nec urna. Curabitur id felis libero. Nullam luctus fringilla metus. Quisque eu tortor vel quam faucibus feugiat. Proin vitae odio massa. Sed fermentum nibh a ligula blandit suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ac faucibus magna. Aliquam ultricies metus arcu, ut vestibulum ipsum volutpat vitae.',
);

ItemModel wallClock05 = ItemModel(
  code: 'P00005',
  itemName: 'Relógio Azul Claro',
  imgUrl: 'assets/wall_clocks/P00005.jpg',
  unit: 'un',
  price: 90.00,
  description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque orci dolor, lacinia ac facilisis sit amet, molestie nec urna. Curabitur id felis libero. Nullam luctus fringilla metus. Quisque eu tortor vel quam faucibus feugiat. Proin vitae odio massa. Sed fermentum nibh a ligula blandit suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ac faucibus magna. Aliquam ultricies metus arcu, ut vestibulum ipsum volutpat vitae.',
);

ItemModel wallClock06 = ItemModel(
  code: 'P00006',
  itemName: 'Relógio Azul Escuro',
  imgUrl: 'assets/wall_clocks/P00006.jpg',
  unit: 'un',
  price: 90.00,
  description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque orci dolor, lacinia ac facilisis sit amet, molestie nec urna. Curabitur id felis libero. Nullam luctus fringilla metus. Quisque eu tortor vel quam faucibus feugiat. Proin vitae odio massa. Sed fermentum nibh a ligula blandit suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ac faucibus magna. Aliquam ultricies metus arcu, ut vestibulum ipsum volutpat vitae.',
);

ItemModel wallClock07 = ItemModel(
  code: 'P00007',
  itemName: 'Relógio Azul lkjsljsdfjsdlfdsk',
  imgUrl: 'assets/wall_clocks/P00007.jpg',
  unit: 'un',
  price: 90.00,
  description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque orci dolor, lacinia ac facilisis sit amet, molestie nec urna. Curabitur id felis libero. Nullam luctus fringilla metus. Quisque eu tortor vel quam faucibus feugiat. Proin vitae odio massa. Sed fermentum nibh a ligula blandit suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ac faucibus magna. Aliquam ultricies metus arcu, ut vestibulum ipsum volutpat vitae.',
);

List<ItemModel> items = [
  wallClock01,
  wallClock02,
  wallClock03,
  wallClock04,
  wallClock05,
  wallClock06,
  wallClock07,
];

List<String> categories = [
  'Relógios de Parede',
  'Cinzeiros',
  'Placas Comemorativas',
  'Utilidades',
  'Petisqueiras',
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: wallClock01,
    quantity: 3,
  ),
  CartItemModel(
    item: wallClock03,
    quantity: 1,
  ),
  CartItemModel(
    item: wallClock05,
    quantity: 4,
  ),
  CartItemModel(
    item: wallClock02,
    quantity: 1,
  ),
];

UserModel user = UserModel(
  name: 'Anderson Rocha',
  email: 'anderson@gmail.com',
  phone: '99 9 9999-9999',
  cpf: '123.456.789-00',
  password: '',
);

List<OrderModel> orders = [
  // Pedido 01
  OrderModel(
    id: '1234567-8',
    createdDateTime: DateTime.parse('2022-07-20 09:02:05.450'),
    overdueDateTime: DateTime.parse('2022-07-30 10:02:05.450'),
    items: [
      CartItemModel(
        item: wallClock04,
        quantity: 2,
      ),
      CartItemModel(
        item: wallClock07,
        quantity: 1,
      ),
      CartItemModel(
        item: wallClock01,
        quantity: 1,
      ),
      CartItemModel(
        item: wallClock02,
        quantity: 3,
      ),
    ],
    status: 'pending_payment',
    copyAndPaste: 'dssfjijjokpopofspo',
    total: 488.0,
  ),

  // Pedido 02
  OrderModel(
    id: '8765432-1',
    createdDateTime: DateTime.parse('2022-07-23 22:02:05.450'),
    overdueDateTime: DateTime.parse('2022-07-30 23:02:05.450'),
    items: [
      CartItemModel(
        item: wallClock07,
        quantity: 1,
      ),
      CartItemModel(
        item: wallClock01,
        quantity: 1,
      ),
      CartItemModel(
        item: wallClock02,
        quantity: 3,
      ),
    ],
    status: 'paid',
    copyAndPaste: 'dssfjijjokpopofspo',
    total: 390.0,
  ),

  // Pedido 03
  OrderModel(
    id: '1234567-8',
    createdDateTime: DateTime.parse('2022-07-20 09:02:05.450'),
    overdueDateTime: DateTime.parse('2022-07-30 10:02:05.450'),
    items: [
      CartItemModel(
        item: wallClock04,
        quantity: 2,
      ),
      CartItemModel(
        item: wallClock07,
        quantity: 1,
      ),
      CartItemModel(
        item: wallClock01,
        quantity: 1,
      ),
      CartItemModel(
        item: wallClock02,
        quantity: 3,
      ),
    ],
    status: 'preparing_purchase',
    copyAndPaste: 'dssfjijjokpopofspo',
    total: 488.0,
  ),

  // Pedido 04
  OrderModel(
    id: '8765432-1',
    createdDateTime: DateTime.parse('2022-07-23 22:02:05.450'),
    overdueDateTime: DateTime.parse('2022-07-30 23:02:05.450'),
    items: [
      CartItemModel(
        item: wallClock07,
        quantity: 1,
      ),
      CartItemModel(
        item: wallClock01,
        quantity: 1,
      ),
      CartItemModel(
        item: wallClock02,
        quantity: 3,
      ),
    ],
    status: 'delivered',
    copyAndPaste: 'dssfjijjokpopofspo',
    total: 390.0,
  ),
];
