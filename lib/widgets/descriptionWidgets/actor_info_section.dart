import 'package:flutter/material.dart';

class ActorInfoSection extends StatelessWidget {
  const ActorInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Actor Name',
            style: TextStyle(
                fontSize: 25,
                color: Color(0xFF002a40),
                fontWeight: FontWeight.bold)),
        SizedBox(height: 3),
        Text(
          'Indian Actress',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ],
    );
  }
}
