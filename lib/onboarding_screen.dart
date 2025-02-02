import 'package:flutter/material.dart';
import 'package:hotel_management/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() => isLastPage = (index == 3));
            },
            children: [
              buildPage(
                image: "assets/images/booking.png",
                title: "Booking Hotel",
                description:
                "You can book a hotel easily and quickly with Tracvel application make easier.",
              ),
              buildPage(
                image: "assets/images/hotel_blue.png",
                title: "Discover Place",
                description:
                "Discover interesting places around you with Tracvel application make easier.",
              ),
              buildPage(
                image: "assets/images/discover.png",
                title: "Easy Find Hotel",
                description:
                "Easy to find a hotel that suits your needs with Tracvel application make easier.",
              ),
              buildPage(
                image: "assets/images/relaxation.png",
                title: "A Home away from Home",
                description:
                "Easy to find a hotel that suits your needs with Tracvel application make easier.",
              ),
            ],
          ),

          // Skip Button (Hidden on the last page)
          if (!isLastPage)
            Positioned(
              top: MediaQuery.of(context).padding.top + 20,
              right: 20,
              child: TextButton(
                onPressed: () {
                  _controller.jumpToPage(3); // Jump to the last page
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenSize.width * 0.04,
                  ),
                ),
              ),
            ),

          // Page Indicator
          Positioned(
            bottom: screenSize.height * 0.1,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect: WormEffect(
                  dotWidth: screenSize.width * 0.025,
                  dotHeight: screenSize.width * 0.025,
                  activeDotColor: Colors.black,
                  dotColor: Colors.grey.shade300,
                ),
              ),
            ),
          ),

          // Next/Get Started Button
          Positioned(
            bottom: bottomPadding + screenSize.height * 0.03,
            right: screenSize.width * 0.05,
            child: isLastPage
                ? ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.myBlue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.05,
                  vertical: screenSize.height * 0.015,
                ),
              ),
              child: Text(
                "Get Started",
                style: TextStyle(
                  fontSize: screenSize.width * 0.04,
                ),
              ),
            )
                : FloatingActionButton(
              onPressed: () {
                _controller.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              backgroundColor: AppColors.myBlue,
              foregroundColor: Colors.white,
              child: Icon(
                Icons.arrow_forward,
                size: screenSize.width * 0.06,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(height: constraints.maxHeight * 0.1),
            Container(
              height: constraints.maxHeight * 0.5,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.08,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: constraints.maxWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: constraints.maxWidth * 0.04,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}