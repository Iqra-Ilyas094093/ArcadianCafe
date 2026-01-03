import 'package:flutter/material.dart';

import '../../../utils/order_data.dart';
import '../../../utils/text_styles.dart';
import 'order_card.dart';

class OrdersList extends StatelessWidget {
  final bool isOngoing;

  const OrdersList({super.key, required this.isOngoing});

  @override
  Widget build(BuildContext context) {
    final orders = isOngoing ? ongoingOrders : completedOrders;

    if (orders.isEmpty) {
      return Center(
        child: Text(
          'No orders found',
          style: AppTextStyles.bodyText2,
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderCard(order: orders[index]);
      },
    );
  }
}
