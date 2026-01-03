import 'package:flutter/material.dart';

import '../../../model/saved_addresses.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class AddressBottomSheet extends StatefulWidget {
  final SavedAddress? address;

  const AddressBottomSheet({super.key, this.address});

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();

}
class _AddressBottomSheetState extends State<AddressBottomSheet> {
  late TextEditingController labelController;
  late TextEditingController addressController;
  late TextEditingController cityController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();

    labelController =
        TextEditingController(text: widget.address?.label ?? '');
    addressController =
        TextEditingController(text: widget.address?.address ?? '');
    cityController =
        TextEditingController(text: widget.address?.city ?? '');
    phoneController =
        TextEditingController(text: widget.address?.phone ?? '');
  }
  @override
  Widget build(BuildContext context) {
    final isEditing = widget.address != null;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 4,
                width: 40,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: AppColors.softBrownGray,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            Text(
              isEditing ? 'Edit Address' : 'Add Address',
              style: AppTextStyles.heading2,
            ),

            const SizedBox(height: 16),

            _inputField('Label (Home / Work)', labelController),
            _inputField('Address', addressController),
            _inputField('City', cityController),
            _inputField('Phone', phoneController, isNumber: true),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkBrown),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(isEditing ? 'Update Address' : 'Save Address',style: AppTextStyles.buttonText,),
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
      String hint,
      TextEditingController controller, {
        bool isNumber = false,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType:
        isNumber ? TextInputType.phone : TextInputType.text,
        style: AppTextStyles.bodyText1,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.bodyText2,
          filled: true,
          fillColor: AppColors.creamBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }


}

