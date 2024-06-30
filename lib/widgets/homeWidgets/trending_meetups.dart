import 'package:flutter/material.dart';

class TrendingMeetupsSection extends StatelessWidget {
  const TrendingMeetupsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Trending Popular Meetups",
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
    return SizedBox(
      height: 400,
      child: _buildHorizontalList(),
    );
  }
}

Widget _buildHorizontalList() {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: SizedBox(
            width: 250,
            child: CustomCard(
              index: index + 1,
            )),
      );
    },
  );
}

class CustomCard extends StatelessWidget {
  final int index;

  const CustomCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/description');
          },
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1527237545644-c3d2a74ede9f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.rectangle),
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 150,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      border: Border.all(color: Colors.transparent)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      index.toString().padLeft(2, '0'),
                      style: const TextStyle(
                          color: Color(0xFF002a40),
                          fontWeight: FontWeight.bold,
                          fontSize: 100),
                    ),
                  ),
                ))
          ]),
        ));
  }
}
