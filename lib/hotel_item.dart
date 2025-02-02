import 'package:flutter/material.dart';

class HotelItem extends StatelessWidget {
  final String name;
  final String distance;
  final String imagePath;

  HotelItem(this.name, this.distance, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 150,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'Distance: $distance',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

