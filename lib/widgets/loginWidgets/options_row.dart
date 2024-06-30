import 'package:flutter/material.dart';

class OptionsRow extends StatelessWidget {
  const OptionsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: false, onChanged: (bool? value) {}),
            const Text("Remember Me"),
          ],
        ),
        const Text(
          "Forgot Password",
          style: TextStyle(color: Color(0xFF06699c), fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
