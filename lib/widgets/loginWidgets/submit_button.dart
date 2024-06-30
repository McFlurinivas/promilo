import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final bool isProcessing;
  final VoidCallback onPressed;

  const SubmitButton({
    Key? key,
    required this.isProcessing,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        minimumSize: const Size(double.infinity, 0),
        padding: const EdgeInsets.symmetric(vertical: 12),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: isProcessing ? null : onPressed,
      child: const Text('Submit', style: TextStyle(color: Colors.white)),
    );
  }
}
