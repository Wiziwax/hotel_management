import 'package:flutter/material.dart';
import 'package:hotel_management/utils/app_colors.dart';

class FrontDesk extends StatelessWidget {
  const FrontDesk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine if the app is in light or dark mode
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Location and Profile Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.person, color: Colors.blue),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Welcome',
                                    style: TextStyle(
                                      // color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Chika',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // Icon(Icons.keyboard_arrow_down),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Search Bar
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? AppColors.rankTextColor
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              // color: Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search Guest',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      // color: Colors.grey,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.teal[700],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child:
                                  const Icon(Icons.tune, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // New Collection Banner
                      InkWell(
                        onTap: () {
                          // Handle the click event here
                          print('Container clicked!');
                          Navigator.pushNamed(context, '/room_manager');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? AppColors.rankTextColor
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.green,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Room Manager',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const SizedBox(height: 12),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle button click
                                        print('Button clicked!');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.teal[700],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Text(
                                        'Go to Room Manager',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/images/captain_hat.png',
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Categories
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'General',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(color: Colors.green, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCategoryItem(
                              Icons.calendar_month, 'Bookings', context),
                          _buildCategoryItem(Icons.people, 'Guests', context),
                          _buildCategoryItem(
                              Icons.event_available, 'Orders', context),
                          _buildCategoryItem(
                              Icons.price_change, 'Price list', context),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Flash Sale
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Other',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ), // Row(
                        ],
                      ),
                      const SizedBox(height: 5),

                      // Filter Chips
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildFilterChip('All', true, context),
                            _buildFilterChip('Inventory', false, context),
                            _buildFilterChip('Guests', false, context),
                            _buildFilterChip('Staff', false, context),
                            _buildFilterChip('Hotel', false, context),
                            _buildFilterChip('Accounting', false, context),
                            // _buildFilterChip('Bedroom', false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Text(
                      //       'Other',
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ), // Row(
                      //   ],
                      // ),
                      // const SizedBox(height: 5),

                      // Product Grid
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.8,
                        children: [
                          _buildProductCard(
                              title: 'Transactions',

                              imagePath: 'assets/images/coins.png',
                              icon: Icons.attach_money,
                              description: 'Overview of transactions',
                              context: context),
                          _buildProductCard(
                              title: 'Reports',
                              imagePath: 'assets/images/reports.png',
                              icon: Icons.bar_chart,
                              description: 'Go to reports',
                              context: context),
                          _buildProductCard(
                              title: 'Inventory',
                              imagePath: 'assets/images/inventory.png',
                              icon: Icons.inventory,
                              description: 'Management of Inventory and Stocks',
                              context: context),
                          _buildProductCard(
                              title: 'Profiles',
                              imagePath: 'assets/images/profile_manager.png',
                              icon: Icons.people,
                              description:
                                  'Management of every user\'s profile',
                              context: context),
                          _buildProductCard(
                              title: 'Configure',
                              imagePath: 'assets/images/configurations.png',
                              icon: Icons.people,
                              description: 'Update prices, and other services',
                              context: context),
                          _buildProductCard(
                              title: 'Maintenance',
                              imagePath: 'assets/images/maintenance.png',
                              icon: Icons.people,
                              description: 'Update prices, and other services',
                              context: context),
                          _buildProductCard(
                              title: 'Ratings',
                              imagePath: 'assets/images/ratings.png',
                              description:
                                  'Customer ratings on different services',
                              icon: Icons.eighteen_up_rating,
                              context: context)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            // BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.teal[700],
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label, BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.rankTextColor : Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
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
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildProductCard(
      {required String title,
      required String imagePath,
      required String description,
      required IconData icon,
      required BuildContext context}) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.rankTextColor : Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14,
                    // , color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
