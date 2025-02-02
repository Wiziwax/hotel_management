import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690)); // Initialize screen util

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Back, Admin!', style: TextStyle(fontSize: 20.sp)),
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
                'General',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
              ),
              SizedBox(height: 24.h),
              _buildMetricsGrid(),
              SizedBox(height: 24.h),
              Text(
                'Revenue Overview',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              // Add more widgets for revenue overview if needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
      crossAxisCount: 2, // Number of columns
      crossAxisSpacing: 16.w, // Spacing between columns
      mainAxisSpacing: 16.h, // Spacing between rows
      childAspectRatio: 0.9, // Adjust aspect ratio to fit content
      children: [
        _buildMetricCard('assets/images/customer.png', 'Total Orders'),
        _buildMetricCard('assets/images/customer.png', 'Total Products'),
        _buildMetricCard('assets/images/customer.png', 'Total Customer'),
        _buildMetricCard('assets/images/customer.png', 'Total Revenue'),
        _buildMetricCard('assets/images/customer.png', 'Total Sales'),
        _buildMetricCard('assets/images/customer.png', 'Inventory'),
      ],
    );
  }

  Widget _buildMetricCard(String imagePath, String title) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0.w), // Rounded corners
      ),
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
              Image.asset(
                imagePath,
                width: 60.w, // Responsive image width
                height: 60.h, // Responsive image height
                fit: BoxFit.fill,
              ),
              SizedBox(height: 12.h),
              Text(
                title,
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
    );
  }
}
// class DashboardScreen2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context, designSize: Size(360, 690)); // Initialize screen util
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dp Shop'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Welcome Back, Admin!', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),
//               SizedBox(height: 16.h),
//               Text('Here\'s an overview of your store:', style: TextStyle(fontSize: 16.sp)),
//               SizedBox(height: 24.h),
//               _buildStoreOverview(),
//               SizedBox(height: 24.h),
//               Text('Revenue Overview', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
//               SizedBox(height: 16.h),
//               Text('Monthly View', style: TextStyle(fontSize: 16.sp)),
//               SizedBox(height: 24.h),
//               Text('Recent Orders', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
//               SizedBox(height: 16.h),
//               _buildRecentOrdersTable(),
//               SizedBox(height: 24.h),
//               Text('Top Products', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
//               SizedBox(height: 16.h),
//               _buildTopProductsTable(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildStoreOverview() {
//     return Row(
//       children: [
//         Expanded(
//           child: _buildOverviewCard('Total Sales', '\$24,780'),
//         ),
//         SizedBox(width: 16.w),
//         Expanded(
//           child: _buildOverviewCard('Total Orders', '\$12,280'),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildOverviewCard(String title, String value) {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title, style: TextStyle(fontSize: 16.sp)),
//             SizedBox(height: 8.h),
//             Text(value, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildRecentOrdersTable() {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             _buildTableRow(['Order ID', 'Customer', 'Status', 'Amount']),
//             Divider(),
//             _buildTableRow(['PORD-2345', 'Customer 1', 'Completed', '\$120']),
//             _buildTableRow(['PORD-2346', 'Customer 2', 'Pending', '\$170']),
//             _buildTableRow(['PORD-2347', 'Customer 3', 'Completed', '\$220']),
//             _buildTableRow(['PORD-2348', 'Customer 4', 'Pending', '\$270']),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTopProductsTable() {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             _buildTableRow(['Product', 'Sales']),
//             Divider(),
//             _buildTableRow(['Product 1', '1000 table']),
//             _buildTableRow(['Product 2', '850 table']),
//             _buildTableRow(['Product 3', '750 table']),
//             _buildTableRow(['Product 4', '640 table']),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTableRow(List<String> cells) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: cells.map((cell) => Expanded(child: Text(cell))).toList(),
//       ),
//     );
//   }
// }