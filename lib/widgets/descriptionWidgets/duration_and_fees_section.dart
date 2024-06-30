import 'package:flutter/material.dart';

class DurationAndFeesSection extends StatelessWidget {
  const DurationAndFeesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.timer_outlined, color: Colors.grey),
            SizedBox(width: 5),
            Text('Duration 20 Mins',
                style: TextStyle(color: Colors.grey, fontSize: 17))
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.wallet_outlined, color: Colors.grey),
            SizedBox(width: 5),
            Text('Total Average Fees Rs.9999',
                style: TextStyle(color: Colors.grey, fontSize: 17))
          ],
        ),
      ],
    );
  }
}
