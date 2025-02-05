import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../utils/app_colors.dart';

class CheckinPage extends StatefulWidget {
  @override
  _CheckinPageState createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinPage> {
  final _formKey = GlobalKey<FormState>();
  final _pageController = PageController();
  int _currentPage = 0;

  // Guest Information Controllers
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _idNumberController = TextEditingController();
  String? _selectedIdType;

  // Reservation Details Controllers
  final _reservationNumberController = TextEditingController();
  final _checkInController = TextEditingController();
  final _checkOutController = TextEditingController();
  String? _selectedRoomType;
  String? _roomNumber;

  // Payment Details Controllers
  final _amountController = TextEditingController();
  final _depositController = TextEditingController();
  String? _selectedPaymentMethod;
  bool _saveCard = false;

  // Additional Guest Details
  final _numberOfGuestsController = TextEditingController();
  List<Map<String, String>> additionalGuests = [];

  // Preferences
  String? _selectedSmokingPreference;
  String? _selectedBedType;
  bool _needsAccessibility = false;
  List<String> _selectedDietaryPreferences = [];

  // Policy Agreement
  bool _agreedToPolicy = false;

  final List<String> idTypes = ['Passport', 'Driver\'s License', 'National ID'];
  final List<String> roomTypes = ['Standard', 'Deluxe', 'Suite', 'Executive'];
  final List<String> paymentMethods = ['Cash', 'Card', 'Bank Transfer', 'Digital Wallet'];
  final List<String> bedTypes = ['Single', 'Double', 'King', 'Twin'];
  final List<String> dietaryOptions = ['Vegetarian', 'Vegan', 'Halal', 'Kosher', 'Gluten-Free'];

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? AppColors.backgroundDark : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Check-in Form',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              children: [
                _buildGuestInformationPage(),
                _buildReservationDetailsPage(),
                _buildPaymentAndPreferencesPage(),
                _buildPolicyAgreementPage(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 4,
                  effect: WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: AppColors.primaryColor,
                    dotColor: Colors.grey.shade300,
                  ),
                ),
                SizedBox(height: 16),
                _buildNavigationButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuestInformationPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Guest Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          _buildTextField(
            controller: _fullNameController,
            label: 'Full Name',
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          SizedBox(height: 16),
          IntlPhoneField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            initialCountryCode: 'NG',
          ),
          SizedBox(height: 16),
          _buildTextField(
            controller: _emailController,
            label: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value?.isEmpty ?? true) return 'Required';
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
                return 'Enter valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          _buildTextField(
            controller: _addressController,
            label: 'Residential Address',
            maxLines: 3,
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          SizedBox(height: 16),
          _buildDropdown(
            value: _selectedIdType,
            items: idTypes,
            label: 'ID Type',
            onChanged: (value) => setState(() => _selectedIdType = value),
          ),
          SizedBox(height: 16),
          _buildTextField(
            controller: _idNumberController,
            label: 'ID Number',
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
        ],
      ),
    );
  }

  Widget _buildReservationDetailsPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Reservation Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          _buildTextField(
            controller: _reservationNumberController,
            label: 'Reservation Number (Optional)',
          ),
          SizedBox(height: 16),
          _buildDropdown(
            value: _selectedRoomType,
            items: roomTypes,
            label: 'Room Type',
            onChanged: (value) => setState(() => _selectedRoomType = value),
          ),
          SizedBox(height: 16),
          _buildDateTimeField(
            controller: _checkInController,
            label: 'Check-in Date & Time',
            isDateTime: true,
          ),
          SizedBox(height: 16),
          _buildDateTimeField(
            controller: _checkOutController,
            label: 'Check-out Date & Time',
            isDateTime: true,
          ),
          SizedBox(height: 16),
          _buildTextField(
            controller: _numberOfGuestsController,
            label: 'Number of Guests',
            keyboardType: TextInputType.number,
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentAndPreferencesPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment & Preferences', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          _buildDropdown(
            value: _selectedPaymentMethod,
            items: paymentMethods,
            label: 'Payment Method',
            onChanged: (value) => setState(() => _selectedPaymentMethod = value),
          ),
          SizedBox(height: 16),
          _buildTextField(
            controller: _amountController,
            label: 'Amount',
            keyboardType: TextInputType.number,
            prefix: Text('₦ '),
          ),
          SizedBox(height: 16),
          _buildTextField(
            controller: _depositController,
            label: 'Deposit Amount',
            keyboardType: TextInputType.number,
            prefix: Text('₦ '),
          ),
          SizedBox(height: 16),
          _buildDropdown(
            value: _selectedSmokingPreference,
            items: ['Smoking', 'Non-Smoking'],
            label: 'Smoking Preference',
            onChanged: (value) => setState(() => _selectedSmokingPreference = value),
          ),
          SizedBox(height: 16),
          _buildDropdown(
            value: _selectedBedType,
            items: bedTypes,
            label: 'Bed Type Preference',
            onChanged: (value) => setState(() => _selectedBedType = value),
          ),
          SizedBox(height: 16),
          _buildMultiSelect(),
        ],
      ),
    );
  }

  Widget _buildPolicyAgreementPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Terms & Policies', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'By checking this box, you agree to our hotel policies including:\n\n'
                    '• Check-out time is 12:00 PM\n'
                    '• No smoking in non-smoking rooms\n'
                    '• Damages will be charged to the card on file\n'
                    '• Cancellation policy as per booking terms',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          SizedBox(height: 16),
          CheckboxListTile(
            value: _agreedToPolicy,
            onChanged: (value) => setState(() => _agreedToPolicy = value ?? false),
            title: Text('I agree to the hotel policies'),
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (_currentPage > 0)
          TextButton(
            onPressed: () => _pageController.previousPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
            child: Text('Back'),
          )
        else
          SizedBox(width: 80),
        _buildContinueButton(),
      ],
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_currentPage < 3) {
            _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else {
            _handleSubmit();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          _currentPage < 3 ? 'Continue' : 'Complete Check-in',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
      ),
    );
  }

  // Helper Widgets
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    int maxLines = 1,
    Widget? prefix,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        prefix: prefix,
      ),
      validator: validator,
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required String label,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
      ),
    );
  }

  Widget _buildDateTimeField({
    required TextEditingController controller,
    required String label,
    bool isDateTime = false,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        suffixIcon: Icon(isDateTime ? Icons.access_time : Icons.calendar_today),
      ),
      onTap: () async {
        if (isDateTime) {
          final DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365)),
          );
          if (date != null) {
            final TimeOfDay? time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (time != null) {
              setState(() {
                controller.text = DateFormat('MM/dd/yyyy HH:mm').format(
                  DateTime(date.year, date.month, date.day, time.hour, time.minute),
                );
              });
            }
          }
        }
      },
    );
  }

  Widget _buildMultiSelect() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dietary Preferences'),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: dietaryOptions.map((option) {
            final isSelected = _selectedDietaryPreferences.contains(option);
            return FilterChip(
              label: Text(option),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedDietaryPreferences.add(option);
                  } else {
                    _selectedDietaryPreferences.remove(option);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  void _handleSubmit() {
    // Implement your submission logic here
    print('Form submitted');
  }
}
