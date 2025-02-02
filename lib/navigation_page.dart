import 'package:flutter/material.dart';
import 'package:hotel_management/main_layout.dart';
import 'package:hotel_management/utils/app_colors.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: [
              // Gradient Background (unchanged)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade50,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                    ],
                    stops: [0.0, 0.15, 0.3, 0.45, 0.6, 0.75, 0.9, 1.0],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Logo section - takes up top half of screen
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Image.asset(
                          'assets/images/mls_logo.jpeg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // Buttons section - positioned in middle of remaining space
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          // This empty space pushes buttons to vertical center
                          Spacer(flex: 1),
                          // Buttons
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                MaterialPageRoute(builder: (context) => MainLayout()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBlue, // Button background color
                                foregroundColor: Colors.white, // Text color
                                padding: EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: Text('Sign In with Google', ),
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/front_desk');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor, // Button background color
                                foregroundColor: Colors.white, // Text color
                                padding: EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: Text('Sign In with Email'),
                            ),
                          ),
                          // This empty space pushes the signup text to bottom
                          Spacer(flex: 2),
                          // Sign up text stays at bottom
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/dashboard');
                            },
                            child: Text(
                              'Don\'t have an account? Sign Up',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}