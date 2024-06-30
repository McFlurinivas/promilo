import 'package:flutter/material.dart';
import 'package:promilo/widgets/descriptionWidgets/corousel_with_indicator_description.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class CarouselSection extends StatefulWidget {
  const CarouselSection({super.key});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  String _currentImageUrl = '';

  Future<void> _shareImage(String imageUrl) async {
    try {
      final directory = await getTemporaryDirectory();

      final imagePath = '${directory.path}/shared_image.jpg';

      final response = await Dio().get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      final file = File(imagePath);
      await file.writeAsBytes(response.data);

      await Share.shareFiles([imagePath], text: 'Check out this image!');
    } catch (e) {
      if (!context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to share image!'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFe0e0e0),
        ),
        child: Column(
          children: [
            CarouselWithIndicatorDescription(onImageChange: (url) {
              setState(() {
                _currentImageUrl = url;
              });
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List<Widget>.from(
                [
                  const Icon(
                    Icons.download_sharp,
                    size: 30,
                    color: Color(0xFF636363),
                  ),
                  const Icon(Icons.bookmark_outline,
                      size: 30, color: Color(0xFF636363)),
                  Image.network(
                      'https://img.icons8.com/?size=100&id=87&format=png&color=000000',
                      scale: 3.5,
                      color: const Color(0xFF636363)),
                  const Icon(Icons.fullscreen, size: 30, color: Colors.black),
                  const Icon(Icons.star_border_outlined,
                      size: 30, color: Colors.black),
                  IconButton(
                      onPressed: () {
                        if (_currentImageUrl.isNotEmpty) {
                          _shareImage(_currentImageUrl);
                        } else {
                          if (!context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No image to share!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        }
                      },
                      icon: const Icon(Icons.share),
                      iconSize: 25,
                      color: Colors.black),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
