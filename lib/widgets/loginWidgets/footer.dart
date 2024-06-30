import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Business User?',
              style: TextStyle(color: Colors.grey[600], fontSize: 15),
            ),
            Text(
              "Don't have an account",
              style: TextStyle(color: Colors.grey[600], fontSize: 15),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Login Here',
              style: TextStyle(
                  color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
