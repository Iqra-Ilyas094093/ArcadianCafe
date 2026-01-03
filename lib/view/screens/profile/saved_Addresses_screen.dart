import 'package:arcadein_cafe/view/screens/profile/address_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../model/saved_addresses.dart';
import '../../../utils/colors.dart';
import '../../../utils/saved_addresses_data.dart';
import '../../../utils/text_styles.dart';

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool hasAddresses = savedAddresses.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.creamBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBrown,
        title: Text('Saved Addresses', style: AppTextStyles.heading2.copyWith(color: AppColors.creamBeige)),
      ),
      body: hasAddresses ? _addressList() : _emptyState(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkBrown,
        child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => AddressBottomSheet(),
            );
          }
      ),
    );
  }

  Widget _addressList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: savedAddresses.length,
      itemBuilder: (context, index) {
        final address = savedAddresses[index];
        return _addressCard(address,context);
      },
    );
  }

  Widget _addressCard(SavedAddress address,context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.softBrownGray),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.location_on, color: AppColors.darkBrown),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(address.label, style: AppTextStyles.heading3),
                const SizedBox(height: 4),
                Text(address.address, style: AppTextStyles.bodyText2),
                Text(address.city, style: AppTextStyles.bodyText2),
                Text(address.phone, style: AppTextStyles.bodyText2),
              ],
            ),
          ),
          PopupMenuButton(
            color: AppColors.creamBackground,
            icon: Icon(Icons.more_vert, color: AppColors.mediumBrown),
              onSelected: (value) {
                if (value == 'edit') {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => AddressBottomSheet(
                      address: address,
                    ),
                  );
                }
              },
              itemBuilder: (context) => [
               PopupMenuItem(
                value: 'edit',
                child: Text('Edit',style: AppTextStyles.bodyText1,),
              ),
               PopupMenuItem(
                value: 'delete',
                child: Text('Delete',style: AppTextStyles.bodyText1,),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _emptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_off,
                size: 80, color: AppColors.softBrownGray),
            const SizedBox(height: 20),
            Text('No saved addresses',
                style: AppTextStyles.heading3),
            const SizedBox(height: 8),
            Text(
              'Add an address to make checkout faster',
              style: AppTextStyles.bodyText2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

}
