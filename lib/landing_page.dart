import 'package:flutter/material.dart';

import 'country_item.dart';
import 'hotel_item.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Back!'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Alex Rin',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Nearby Hotels',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    HotelItem('Hilton Grand Vacations Club', '13.09 KM', 'assets/images/tanjiro.jpg'),
                    HotelItem('Best Western Premier', '10.00 KM', 'assets/images/itachi.jpg'),
                    HotelItem('Renaissance', '8.50 KM', 'assets/images/tomioka.jpg'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Country Hotels',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CountryItem('United States', 'assets/images/usa.png'),
                    CountryItem('Italy', 'assets/images/italy.png'),
                    CountryItem('Spain', 'assets/images/spain.png'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Recommended Hotels',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    HotelItem('6E 30th St. NoMad', '5.00 KM', 'assets/images/tanjiro.jpg'),
                    HotelItem('West 25th E', '7.00 KM', 'assets/images/tanjiro.jpg'),
                    HotelItem('Renaissance', '8.50 KM', 'assets/images/tanjiro.jpg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}

