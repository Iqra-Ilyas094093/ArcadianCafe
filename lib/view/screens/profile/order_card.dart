import 'package:flutter/material.dart';

import '../../../model/order.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.softBrownGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order ID & Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(order.id, style: AppTextStyles.heading3),
              _StatusChip(status: order.status),
            ],
          ),
          const SizedBox(height: 8),

          Text(order.date, style: AppTextStyles.bodyText2),
          const SizedBox(height: 8),

          Text(
            '${order.itemCount} items • Rs ${order.total.toStringAsFixed(0)}',
            style: AppTextStyles.bodyText1,
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final isDelivered = status == 'Delivered';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isDelivered
            ? AppColors.creamBeige
            : AppColors.latte,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: AppTextStyles.bodyText2.copyWith(
          color: AppColors.darkBrown,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

