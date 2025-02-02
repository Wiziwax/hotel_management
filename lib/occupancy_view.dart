import 'package:flutter/material.dart';
import 'package:hotel_management/utils/app_colors.dart';

class OccupancyView extends StatelessWidget {
  // Sample product data
  final List<Map<String, dynamic>> products = [
    {
      'title': 'A1',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'occupied'// Replace with your image path
    },
    {
      'title': 'A2',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'occupied'// Replace with your image path
    },
    {
      'title': 'A3',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'vacant'// Replace with your image path
    },
    {
      'title': 'A4',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'unavailable'// Replace with your image path
    },
    {
      'title': 'A5',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'occupied'// Replace with your image path
    },
    {
      'title': 'A6',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'vacant'// Replace with your image path
    },
    {
      'title': 'A7',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'unavailable'// Replace with your image path
    },
    {
      'title': 'A8',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'reserved'// Replace with your image path
    },
  ];



  final List<Map<String, dynamic>> productsDeluxe = [
    {
      'title': 'B1',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'occupied'// Replace with your image path
    },
    {
      'title': 'B2',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'occupied'// Replace with your image path
    },
    {
      'title': 'B3',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'vacant'// Replace with your image path
    },
    {
      'title': 'B4',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'unavailable'// Replace with your image path
    },
    {
      'title': 'B5',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'occupied'// Replace with your image path
    },
    {
      'title': 'B6',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'vacant'// Replace with your image path
    },
    {
      'title': 'B7',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'unavailable'// Replace with your image path
    },
    {
      'title': 'B8',
      'price': '\$234',
      'image': 'assets/images/itachi.jpg',
      'status': 'reserved'// Replace with your image path
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Overview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Evenly distribute items
                    children: [
                      _legend("Occupied", Colors.red),
                      _legend("Non-occupied", Colors.green),
                      _legend("Unavailable", Colors.grey),
                    ],
                  ),

                  SizedBox(height: 10,),

                  _legend('Reserved', Colors.blue)
                ],
              ),
            ),




            SizedBox(
              height: 50, // Set a height constraint
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip('All', true, context),
                    _buildFilterChip('Standard', false, context),
                    _buildFilterChip('Deluxe', false, context),
                    _buildFilterChip('Executive', false, context),
                    _buildFilterChip('Suite', false, context),
                    _buildFilterChip('Conference', false, context),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 25,
            ),

            Align(
              alignment: Alignment.centerLeft, // Aligns text to the left
              child: Text(
                'Standard',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 7,
            ),

            Expanded(  // This allows the GridView to take up the remaining space
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    title: products[index]['title'],
                    price: products[index]['price'],
                    image: products[index]['image'],
                    status: products[index]['status'],
                  );
                },
              ),
            ),


            SizedBox(
              height: 25,
            ),

            Align(
              alignment: Alignment.centerLeft, // Aligns text to the left
              child: Text(
                'Deluxe',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 7,
            ),

            Expanded(  // This allows the GridView to take up the remaining space
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    title: productsDeluxe[index]['title'],
                    price: productsDeluxe[index]['price'],
                    image: productsDeluxe[index]['image'],
                    status: productsDeluxe[index]['status'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final String status;

  const ProductCard({
    required this.title,
    required this.price,
    required this.image,
    required this.status,
  });

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'occupied':
        return Colors.red;
      case 'vacant':
        return Colors.green;
      case 'unavailable':
        return Colors.grey;
      case 'reserved':
        return Colors.blue;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: _getStatusColor().withOpacity(0.2), // Adding some transparency
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            if (status.toLowerCase() == 'occupied') ...[
              const SizedBox(height: 8),
              Text(
                'Available: 03/02/2025',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

Widget _buildFilterChip(String label, bool isSelected, BuildContext context) {
  final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return Container(
    margin: const EdgeInsets.only(right: 8),
    child: FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool value) {},
      backgroundColor:
      isDarkMode ? AppColors.rankTextColor : Colors.grey[100],
      selectedColor: Colors.teal[700],
      labelStyle: TextStyle(
        color: isSelected
            ? Colors.white // If selected, always white
            : (Theme.of(context).brightness == Brightness.dark
            ? Colors.white // If dark mode and unselected, white
            : Colors.black), // If light mode and unselected, black
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}

Widget _legend(String legendName, Color color) {
  return Container(
    margin: const EdgeInsets.only(right: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center, // Align items in the center
      children: [
        // The colored circle
        Container(
          width: 20,  // Circle size
          height: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8), // Spacing between circle and text

        // The legend text
        Text(
          legendName,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
