import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About',
            style: TextStyle(
                fontSize: 25,
                color: Color(0xFF002a40),
                fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(
            'From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp.', 
            style: TextStyle(fontSize: 17, color: Colors.grey), textAlign: TextAlign.justify),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: Text('See More',
              style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF006599),
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
