import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      scrolledUnderElevation: 0.0,
      floating: true,
      pinned: true,
      backgroundColor: Colors.white,
      expandedHeight: 150.0,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          'promilo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
