import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 0.0),
        ),
        hintText: "Search",
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: const Icon(Icons.mic_rounded),
      ),
    );
  }
}
