import 'package:flutter/material.dart';
import 'package:promilo/widgets/descriptionWidgets/about_section.dart';
import 'package:promilo/widgets/descriptionWidgets/action_section.dart';
import 'package:promilo/widgets/descriptionWidgets/actor_info_section.dart';
import 'package:promilo/widgets/descriptionWidgets/duration_and_fees_section.dart';
import 'package:promilo/widgets/descriptionWidgets/image_options.dart';
import 'package:promilo/widgets/globalWidgets/custom_app_bar.dart';
import 'package:promilo/widgets/globalWidgets/custom_navigation_bar.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Description',
        disableBack: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            CarouselSection(),
            SizedBox(height: 10),
            ActionSection(),
            SizedBox(height: 30),
            Align(alignment: Alignment.centerLeft, child: ActorInfoSection()),
            SizedBox(height: 20),
            DurationAndFeesSection(),
            SizedBox(height: 20),
            AboutSection(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
