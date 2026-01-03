import '../model/order.dart';

final List<Order> ongoingOrders = [
  Order(
    id: '#AC1023',
    date: 'Today, 4:30 PM',
    itemCount: 3,
    total: 1450,
    status: 'Preparing',
  ),
];

final List<Order> completedOrders = [
  Order(
    id: '#AC0991',
    date: 'Yesterday',
    itemCount: 2,
    total: 980,
    status: 'Delivered',
  ),
  Order(
    id: '#AC0955',
    date: 'Dec 24, 2025',
    itemCount: 4,
    total: 2100,
    status: 'Delivered',
  ),
];
