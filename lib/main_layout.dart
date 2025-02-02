import 'package:flutter/material.dart';
import 'package:hotel_management/enums/enum.roles.dart';
import 'package:hotel_management/profile_screen.dart';
import 'package:hotel_management/reports_screen.dart';
import 'package:hotel_management/screens/role_dashboard.dart';
import 'package:hotel_management/utils/app_colors.dart';

import 'bookings_screen.dart';

import 'inventory_screen.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  // These will be your main screens
  final List<Widget> _screens = [
    DashboardScreen(userRole: UserRole.frontDesk,), // Home/Dashboard
    DashboardScreen(userRole: UserRole.manager,), // Home/Dashboard
    DashboardScreen(userRole: UserRole.admin,), // Home/Dashboard
    // BookingsScreen(),  // Bookings management
    // ReportsScreen(),   // Reports
    ProfileScreen(),   // Profile/Settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        title: Text('Hotel Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),

      // Drawer (Side Navigation)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 35, color: AppColors.primaryBlue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Role: Admin',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard, size: 20), // You can also adjust icon size
              title: Text(
                'Dashboard',
                style: TextStyle(fontSize: 16), // Adjust this value as needed
              ),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book, size: 20),
              title: Text(
                'Bookings',
                style: TextStyle(fontSize: 16),
              ),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.inventory, size: 20),
              title: Text(
                'Inventory',
                style: TextStyle(fontSize: 16),
              ),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart, size: 20),
              title: Text(
                'Reports',
                style: TextStyle(fontSize: 16),
              ),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings, size: 20),
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                // Handle settings
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, size: 20),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                // Handle logout
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Main Content
      body: _screens[_selectedIndex],

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Required for more than 3 items
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bookings',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.inventory),
          //   label: 'Inventory',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}