import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithIndicator extends StatelessWidget {
  final List<Map<String, String>> imgList;
  final int currentIndex;
  final Function(int) onPageChanged;

  const CarouselWithIndicator({
    Key? key,
    required this.imgList,
    required this.currentIndex,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarouselSlider(),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
        viewportFraction: 1,
        onPageChanged: (index, reason) => onPageChanged(index),
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

  Widget _buildCarouselItem(Map<String, String> item) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image.network(
              item['url']!,
              fit: BoxFit.cover,
              width: 1000.0,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(10.0)),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.center,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  item['description']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
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
            color: currentIndex == index
                ? const Color.fromRGBO(0, 42, 64, 1.0)
                : const Color.fromRGBO(128, 148, 159, 0.5),
          ),
        );
      }).toList(),
    );
  }
}
