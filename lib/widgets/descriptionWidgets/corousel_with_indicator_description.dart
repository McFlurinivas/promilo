import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithIndicatorDescription extends StatefulWidget {
  final Function(String) onImageChange;

  const CarouselWithIndicatorDescription({super.key, required this.onImageChange});

  @override
  State<CarouselWithIndicatorDescription> createState() => _CarouselWithIndicatorDescriptionState();
}

class _CarouselWithIndicatorDescriptionState extends State<CarouselWithIndicatorDescription> {
  int _currentIndex = 0;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1664199486264-893f075f4afb?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildCarouselSlider(),
        Positioned(
          bottom: 10.0,
          left: 0,
          right: 0,
          child: _buildIndicator(),
        ),
      ],
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
          widget.onImageChange(imgList[_currentIndex]);
        },
      ),
      items: imgList.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return _buildCarouselItem(item);
          },
        );
      }).toList(),
    );
  }

  Widget _buildCarouselItem(String item) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Image.network(
        item,
        fit: BoxFit.cover,
        width: 1000.0,
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgList.asMap().entries.map((entry) {
        final index = entry.key;
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index
                ? Colors.white
                : Colors.white.withOpacity(0.4),
          ),
        );
      }).toList(),
    );
  }
}
