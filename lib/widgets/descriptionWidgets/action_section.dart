import 'package:flutter/material.dart';

class ActionSection extends StatelessWidget {
  const ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(Icons.bookmark_outline,
            size: 20, color: Color(0xFF006599)),
        const Text('1034',
            style: TextStyle(color: Colors.grey, fontSize: 15)),
        Image.network(
            'https://img.icons8.com/?size=100&id=87&format=png&color=000000',
            scale: 5,
            color: const Color(0xFF006599)),
        const Text('1034',
            style: TextStyle(fontSize: 15, color: Colors.grey)),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFe2e2e2),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < 3; i++)
                  const Icon(Icons.star,
                      size: 17, color: Color(0xFF33dae2)),
                const Icon(Icons.star,
                    size: 17, color: Color(0xFFbee1e2)),
                const Icon(Icons.star, size: 17, color: Colors.white)
              ],
            ),
          ),
        ),
        const Text('4.5',
            style: TextStyle(color: Colors.grey, fontSize: 15)),
      ],
    );
  }
}
