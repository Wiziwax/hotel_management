import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../utils/app_colors.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _pageController = PageController();
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  // Guest Details Controllers
  final _roomNumberController = TextEditingController();
  final _guestNameController = TextEditingController();
  final _checkInDateController = TextEditingController();
  final _checkOutDateController = TextEditingController();
  final _checkOutTimeController = TextEditingController();

  // Room Status Controllers
  final _damagesController = TextEditingController();
  final _lostItemsController = TextEditingController();
  bool _roomInspected = false;
  bool _keysReturned = false;
  bool _minibarUsed = false;
  final _minibarChargesController = TextEditingController();

  // Billing Controllers
  final _roomChargesController = TextEditingController();
  final _additionalChargesController = TextEditingController();
  final _minibarTotalController = TextEditingController();
  final _roomServiceController = TextEditingController();
  final _taxController = TextEditingController();
  final _totalAmountController = TextEditingController();
  String? _selectedPaymentMethod;
  final _depositRefundController = TextEditingController();
  bool _billSettled = false;

  int _currentPage = 0;

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
          'Check-out Form',
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
                _buildGuestDetailsPage(),
                _buildRoomStatusPage(),
                _buildBillingPage(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: WormEffect(
                    dotColor: Colors.grey.shade300,
                    activeDotColor: AppColors.primaryColor,
                    dotHeight: 8,
                    dotWidth: 8,
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

  Widget _buildGuestDetailsPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKeys[0],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Guest Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _roomNumberController,
              label: 'Room Number',
              validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _guestNameController,
              label: 'Guest Name',
              validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
            ),
            SizedBox(height: 16),
            _buildDateTimeField(
              controller: _checkInDateController,
              label: 'Check-in Date',
              isDate: true,
            ),
            SizedBox(height: 16),
            _buildDateTimeField(
              controller: _checkOutDateController,
              label: 'Check-out Date',
              isDate: true,
            ),
            SizedBox(height: 16),
            _buildDateTimeField(
              controller: _checkOutTimeController,
              label: 'Check-out Time',
              isDate: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomStatusPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKeys[1],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Room Status',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            CheckboxListTile(
              title: Text('Room Inspected'),
              value: _roomInspected,
              onChanged: (value) => setState(() => _roomInspected = value ?? false),
            ),
            CheckboxListTile(
              title: Text('Keys Returned'),
              value: _keysReturned,
              onChanged: (value) => setState(() => _keysReturned = value ?? false),
            ),
            CheckboxListTile(
              title: Text('Minibar Used'),
              value: _minibarUsed,
              onChanged: (value) {
                setState(() => _minibarUsed = value ?? false);
              },
            ),
            if (_minibarUsed) ...[
              SizedBox(height: 16),
              _buildTextField(
                controller: _minibarChargesController,
                label: 'Minibar Charges',
                keyboardType: TextInputType.number,
                prefix: '\$',
              ),
            ],
            SizedBox(height: 16),
            _buildTextField(
              controller: _damagesController,
              label: 'Damages (if any)',
              maxLines: 3,
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _lostItemsController,
              label: 'Lost Items (if any)',
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBillingPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKeys[2],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Billing Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _roomChargesController,
              label: 'Room Charges',
              keyboardType: TextInputType.number,
              prefix: '\$',
              readOnly: true,
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _additionalChargesController,
              label: 'Additional Charges',
              keyboardType: TextInputType.number,
              prefix: '\$',
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _roomServiceController,
              label: 'Room Service Charges',
              keyboardType: TextInputType.number,
              prefix: '\$',
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _taxController,
              label: 'Tax',
              keyboardType: TextInputType.number,
              prefix: '\$',
              readOnly: true,
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _totalAmountController,
              label: 'Total Amount',
              keyboardType: TextInputType.number,
              prefix: '\$',
              readOnly: true,
            ),
            SizedBox(height: 16),
            _buildDropdown(
              value: _selectedPaymentMethod,
              label: 'Payment Method',
              items: ['Cash', 'Credit Card', 'Debit Card', 'Digital Wallet'],
              onChanged: (value) => setState(() => _selectedPaymentMethod = value),
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _depositRefundController,
              label: 'Deposit Refund Amount',
              keyboardType: TextInputType.number,
              prefix: '\$',
            ),
            SizedBox(height: 16),
            CheckboxListTile(
              title: Text('Bill Settled'),
              value: _billSettled,
              onChanged: (value) => setState(() => _billSettled = value ?? false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    bool readOnly = false,
    int? maxLines,
    String? prefix,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        labelText: label,
        prefixText: prefix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
      ),
      validator: validator,
    );
  }

  Widget _buildDateTimeField({
    required TextEditingController controller,
    required String label,
    required bool isDate,
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
        suffixIcon: Icon(isDate ? Icons.calendar_today : Icons.access_time),
      ),
      onTap: () async {
        if (isDate) {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (picked != null) {
            setState(() {
              controller.text = DateFormat('MM/dd/yyyy').format(picked);
            });
          }
        } else {
          final TimeOfDay? picked = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (picked != null) {
            setState(() {
              controller.text = picked.format(context);
            });
          }
        }
      },
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String label,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
      ),
      items: items
          .map((item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      ))
          .toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (_currentPage > 0)
          TextButton(
            onPressed: () {
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text('Back'),
          )
        else
          SizedBox(width: 80),
        ElevatedButton(
          onPressed: () {
            if (_formKeys[_currentPage].currentState?.validate() ?? false) {
              if (_currentPage < 2) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                _handleCheckout();
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          ),
          child: Text(
            _currentPage == 2 ? 'Complete Checkout' : 'Continue',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ),
      ],
    );
  }

  void _handleCheckout() {
    // Implement checkout logic here
    if (!_roomInspected) {
      _showError('Room inspection required before checkout');
      return;
    }
    if (!_keysReturned) {
      _showError('Please ensure all keys are returned');
      return;
    }
    if (!_billSettled) {
      _showError('Please settle all bills before checkout');
      return;
    }

    // If all checks pass, proceed with checkout
    print('Checkout completed successfully');
    // Add your checkout completion logic here
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}