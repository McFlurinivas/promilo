import 'package:flutter/material.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.network('https://img.icons8.com/?size=100&id=17949&format=png&color=000000', scale: 2),
        Image.network('https://img.icons8.com/?size=100&id=xuvGCOXi8Wyg&format=png&color=000000', scale: 2),
        Image.network('https://img.icons8.com/?size=100&id=13912&format=png&color=000000', scale: 2),
        Image.network('https://img.icons8.com/?size=100&id=Xy10Jcu1L2Su&format=png&color=000000', scale: 2),
        Image.network('https://img.icons8.com/?size=100&id=16713&format=png&color=000000', scale: 2),
      ],
    );
  }
}
