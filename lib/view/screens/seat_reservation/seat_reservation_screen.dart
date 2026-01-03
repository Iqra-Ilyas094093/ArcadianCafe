import 'package:arcadein_cafe/utils/colors.dart';
import 'package:arcadein_cafe/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class SeatReservationScreen extends StatefulWidget {
  const SeatReservationScreen({super.key});

  @override
  State<SeatReservationScreen> createState() => _SeatReservationScreenState();
}

class _SeatReservationScreenState extends State<SeatReservationScreen> {
  // Branches
  String? selectedBranch;
  final List<String> branches = [
    'Main Street',
    'City Center',
    'Mall Outlet',
  ];

  // Date & Time
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // Guests
  int numberOfGuests = 1;

  // User Details
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamBackground,
      appBar: AppBar(
        title: const Text(
          'Reserve a Table',
        ),
        backgroundColor: AppColors.darkBrown,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Branch Selection
              Text('Select Branch', style: AppTextStyles.heading3),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedBranch,
                hint: Text('Select Branch', style: AppTextStyles.bodyText2),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                icon: Icon(Icons.arrow_drop_down, color: AppColors.darkBrown),
                items: branches.map((branch) {
                  return DropdownMenuItem<String>(
                    value: branch,
                    child: Text(branch, style: AppTextStyles.bodyText1),
                  );
                }).toList(),
                validator: (value) =>
                value == null ? 'Please select a branch' : null,
                onChanged: (value) {
                  setState(() {
                    selectedBranch = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              // Date Picker
              Text('Select Date', style: AppTextStyles.heading3),
              const SizedBox(height: 8),
              InkWell(
                onTap: _pickDate,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.softBrownGray, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate != null
                            ? DateFormat('EEE, MMM d, yyyy').format(selectedDate!)
                            : 'Select Date',
                        style: selectedDate != null
                            ? AppTextStyles.bodyText1
                            : AppTextStyles.bodyText2,
                      ),
                      Icon(Icons.calendar_today, color: AppColors.darkBrown),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Time Picker
              Text('Select Time', style: AppTextStyles.heading3),
              const SizedBox(height: 8),
              InkWell(
                onTap: _pickTime,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.softBrownGray, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedTime != null
                            ? selectedTime!.format(context)
                            : 'Select Time',
                        style: selectedTime != null
                            ? AppTextStyles.bodyText1
                            : AppTextStyles.bodyText2,
                      ),
                      Icon(Icons.access_time, color: AppColors.darkBrown),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Number of Guests
              Text('Number of Guests', style: AppTextStyles.heading3),
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (numberOfGuests > 1) {
                        setState(() {
                          numberOfGuests--;
                        });
                      }
                    },
                    icon: Icon(Icons.remove_circle_outline,
                        color: AppColors.darkBrown, size: 28),
                  ),
                  Text(
                    '$numberOfGuests',
                    style: AppTextStyles.heading2,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        numberOfGuests++;
                      });
                    },
                    icon: Icon(Icons.add_circle_outline,
                        color: AppColors.darkBrown, size: 28),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Name (if guest)
              Text('Name', style: AppTextStyles.heading3),
              const SizedBox(height: 8),
              TextFormField(
                controller: nameController,
                style: AppTextStyles.bodyText1,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle: AppTextStyles.bodyText2,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? 'Please enter your name' : null,
              ),

              const SizedBox(height: 16),

              // Phone
              Text('Phone', style: AppTextStyles.heading3),
              const SizedBox(height: 8),
              TextFormField(
                controller: phoneController,
                style: AppTextStyles.bodyText1,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                  hintStyle: AppTextStyles.bodyText2,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your phone number'
                    : null,
              ),

              const SizedBox(height: 16),

              // Notes
              Text('Notes (Optional)', style: AppTextStyles.heading3),
              const SizedBox(height: 8),
              TextFormField(
                controller: notesController,
                style: AppTextStyles.bodyText1,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Any special request?',
                  hintStyle: AppTextStyles.bodyText2,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),

              const SizedBox(height: 24),

              // Confirm Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkBrown,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _confirmReservation,
                  child: Text('Confirm Reservation',
                      style: AppTextStyles.buttonText),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Pick Date
  Future<void> _pickDate() async {
    DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Pick Time
  Future<void> _pickTime() async {
    final TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // Confirm Reservation
  void _confirmReservation() {
    if (_formKey.currentState!.validate()) {
      if (selectedBranch == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a branch')),
        );
        return;
      }
      if (selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a date')),
        );
        return;
      }
      if (selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a time')),
        );
        return;
      }

      // Show Confirmation Dialog
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Reservation Confirmed'),
          content: Text(
              'Your table at $selectedBranch is booked for ${DateFormat('EEE, MMM d, yyyy').format(selectedDate!)} at ${selectedTime!.format(context)} for $numberOfGuests guests.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
