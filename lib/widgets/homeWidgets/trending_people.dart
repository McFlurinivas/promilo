import 'package:flutter/material.dart';

class TrendingPeopleSection extends StatelessWidget {
  const TrendingPeopleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Trending Popular People",
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF062F44),
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10),
        CustomScrollLists(),
      ],
    );
  }
}

class CustomScrollLists extends StatelessWidget {
  const CustomScrollLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _buildHorizontalList(),
    );
  }
}

Widget _buildHorizontalList() {
  List<String> headings = ['Author', 'Actors', 'CEOs'];
  List<String> images = [
    'https://thumb.ac-illust.com/52/5277bb33ec89c9ef3e657784a084c576_t.jpeg',
    'https://img.icons8.com/?size=100&id=13483&format=png&color=000000',
    'https://img.icons8.com/?size=100&id=13519&format=png&color=000000'
  ];
  return SizedBox(
    height: 230,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SizedBox(
              width: 300,
              child: CustomCard(
                heading: headings[index],
                images: images[index],
              )),
        );
      },
    ),
  );
}

class CustomCard extends StatelessWidget {
  final String heading;
  final String images;

  const CustomCard({Key? key, required this.heading, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> image = [
      'https://plus.unsplash.com/premium_photo-1664870883044-0d82e3d63d99?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://plus.unsplash.com/premium_photo-1673866484792-c5a36a6c025e?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=1364&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    ];
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.grey, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildImageAvatar(images, Colors.black),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF062F44)),
                    ),
                    const Text(
                      '1,028 Meetups',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(height: 30, color: Colors.grey[500]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (int i = 0; i < image.length; i++)
                  Align(
                    widthFactor: 0.8,
                    child: _buildImageAvatar(image[i], Colors.transparent),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  backgroundColor: const Color(0xFF006599),
                ),
                child: const Text('See more',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageAvatar(String image, Color color) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: 1,
        ),
      ),
    );
  }
}
