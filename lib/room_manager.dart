import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hotel_management/occupancy_view.dart';
import 'package:hotel_management/utils/app_colors.dart';


class RoomManager extends StatelessWidget {
  final List<ServiceItem> services = [
    ServiceItem(icon: Icons.calendar_today, title: 'Room Booking'),
    ServiceItem(icon: Icons.build, title: 'Room Maintenance'),
    ServiceItem(icon: Icons.person, title: 'Guest Info'),
    ServiceItem(icon: Icons.cleaning_services, title: 'Housekeeping'),
    ServiceItem(icon: Icons.shopping_bag, title: 'Reservations'),
    ServiceItem(icon: Icons.flash_on, title: 'Quick Actions'),

    // Manager
    ServiceItem(icon: Icons.area_chart, title: 'Analytics and Reports'),
    ServiceItem(icon: Icons.rate_review, title: 'Guest Feedback'),
    ServiceItem(icon: Icons.inventory, title: 'Room Inventory'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Room Manager',
          // style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            CloudStorageStats(),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return ServiceCard(service: services[index]);
                },
              ),
            ),
            SizedBox(height: 16),
            // Container(
            //   width: double.infinity,
            //   height: 50,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: Text('Continue'),
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.blue,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final ServiceItem service;

  const ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                service.icon,
                // color: AppColors.primaryBlue,
                size: 24,
              ),
            ),
            SizedBox(width: 8),
      Flexible(  // This prevents overflow
        child: Text(
          service.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),],

        ),
      ),
    );
  }
}

class ServiceItem {
  final IconData icon;
  final String title;

  ServiceItem({required this.icon, required this.title});
}


class CloudStorageStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Custom Progress Indicator
              SizedBox(
                width: 100,
                height: 100,
                child: CustomPaint(
                  painter: CircularProgressPainter(
                    percentage: 0.7, // 80%
                    progressColor: AppColors.primaryBlue,
                    backgroundColor: Colors.blue.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Text(
                      '80%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),

              // Storage Details
      InkWell(
        onTap: () {
          // Navigate to another page
          Navigator.pushNamed(
            context, '/occupancy'
             // Replace with your target page
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Room Occupancy',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '80 of 100 rooms occupied',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'View Details',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
            ],
          ),
          SizedBox(height: 24),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  icon: Icons.login,
                  label: 'Check In',
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _ActionButton(
                  icon: Icons.logout,
                  label: 'Check Out',
                  color: AppColors.myBlue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Circular Progress Painter
class CircularProgressPainter extends CustomPainter {
  final double percentage;
  final Color progressColor;
  final Color backgroundColor;

  CircularProgressPainter({
    required this.percentage,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    final strokeWidth = 8.0;

    // Draw background circle
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress arc
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Start from top
      2 * pi * percentage, // Draw based on percentage
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// Action Button Widget
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 32),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}