class Order {
  final String id;
  final String date;
  final int itemCount;
  final double total;
  final String status;

  Order({
    required this.id,
    required this.date,
    required this.itemCount,
    required this.total,
    required this.status,
  });
}
