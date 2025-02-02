import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../enums/enum.roles.dart';

class DashboardScreen extends StatelessWidget {
  final UserRole userRole;

  const DashboardScreen({Key? key, required this.userRole}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690)); // Initialize screen util

    return Scaffold(
      appBar: AppBar(
        title: Text(
          userRole == UserRole.frontDesk
              ? 'Front Desk Dashboard'
              : userRole == UserRole.manager
              ? 'Manager Dashboard'
              : 'Admin Dashboard',
          style: TextStyle(fontSize: 20.sp),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome!',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
              ),
              SizedBox(height: 24.h),
              _buildDashboardGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardGrid(BuildContext context) {
    List<Map<String, dynamic>> gridItems = [];

    switch (userRole) {
      case UserRole.frontDesk:
        gridItems = [
          {'icon': Icons.check_box_outline_blank, 'label': 'Check-In', 'route': '/checkin'},
          {'icon': Icons.check_box, 'label': 'Check-Out', 'route': '/checkout'},
          {'icon': Icons.room_service, 'label': 'Room Service', 'route': '/roomservice'},
          {'icon': Icons.cleaning_services, 'label': 'Housekeeping', 'route': '/housekeeping'},
          {'icon': Icons.calendar_today, 'label': 'Bookings', 'route': '/bookings'},
          {'icon': Icons.people, 'label': 'Guests', 'route': '/guests'},
        ];
        break;
      case UserRole.manager:
        gridItems = [
          {'icon': Icons.bar_chart, 'label': 'Revenue', 'route': '/revenue'},
          {'icon': Icons.people, 'label': 'Staff', 'route': '/staff'},
          {'icon': Icons.room, 'label': 'Occupancy', 'route': '/occupancy'},
          {'icon': Icons.report, 'label': 'Reports', 'route': '/reports'},
          {'icon': Icons.feedback, 'label': 'Feedback', 'route': '/feedback'},
          {'icon': Icons.settings, 'label': 'Settings', 'route': '/settings'},
        ];
        break;
      case UserRole.admin:
        gridItems = [
          {'icon': Icons.people, 'label': 'Users', 'route': '/users'},
          {'icon': Icons.settings, 'label': 'System Settings', 'route': '/systemsettings'},
          {'icon': Icons.analytics, 'label': 'Analytics', 'route': '/analytics'},
          {'icon': Icons.backup, 'label': 'Backup', 'route': '/backup'},
          {'icon': Icons.security, 'label': 'Security', 'route': '/security'},
          {'icon': Icons.payment, 'label': 'Payments', 'route': '/payments'},
        ];
        break;
    }

    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
      crossAxisCount: 2, // Number of columns
      crossAxisSpacing: 16.w, // Spacing between columns
      mainAxisSpacing: 16.h, // Spacing between rows
      childAspectRatio: 1.2, // Adjust aspect ratio to fit content
      children: gridItems.map((item) {
        return _buildGridItem(context, item['icon'], item['label'], item['route']);
      }).toList(),
    );
  }

  Widget _buildGridItem(BuildContext context, IconData icon, String label, String route) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0.w), // Rounded corners
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route); // Navigate to the specified route
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12.0.w),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40.sp, color: Colors.white),
                SizedBox(height: 12.h),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}