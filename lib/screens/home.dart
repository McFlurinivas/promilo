import 'package:flutter/material.dart';
import 'package:promilo/widgets/globalWidgets/custom_navigation_bar.dart';
import 'package:promilo/widgets/homeWidgets/carousel_with_indicator_home.dart';
import 'package:promilo/widgets/homeWidgets/search_field.dart';
import 'package:promilo/widgets/homeWidgets/trending_meetups.dart';
import 'package:promilo/widgets/homeWidgets/trending_people.dart';
import 'package:promilo/widgets/globalWidgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> imgList = [
    {
      'url':
          'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description': 'Popular Meetups\nin India',
    },
    {
      'url':
          'https://plus.unsplash.com/premium_photo-1664199486264-893f075f4afb?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description': 'Technical Internships\nin India',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description': 'Popular Colleges\nin India',
    },
  ];

  int currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Individual Meetup',
          disableBack: true,
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const SearchField(),
            const SizedBox(height: 20),
            CarouselWithIndicator(
              imgList: imgList,
              currentIndex: currentIndex,
              onPageChanged: _onPageChanged,
            ),
            const SizedBox(height: 20),
            const TrendingPeopleSection(),
            const SizedBox(height: 20),
            const TrendingMeetupsSection(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar()
    );
  }
}
