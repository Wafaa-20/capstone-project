import 'package:flutter/material.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';
import 'package:taleq/features/specialists/presentation/pages/overview_tab.dart';
import 'package:taleq/features/specialists/presentation/pages/session_booking_tab.dart';
import 'package:taleq/features/specialists/presentation/pages/specialists_page.dart';
import 'package:taleq/features/specialists/presentation/widgets/specialists_body.dart';

class SpecialistProfilePage extends StatelessWidget {
  const SpecialistProfilePage({
    super.key,
    required this.image,
    required this.name,
    required this.subtitle,
    required this.rating,
  });
  final String image;
  final String name;
  final String subtitle;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          icon: Icons.arrow_back_ios,
          onPressed: () => context.customPush(SpecialistsPage()),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SpecialistsBody(
                image: image,
                name: name,
                subtitle: subtitle,
                isRating: true,
                rating: rating,
              ),
              const SizedBox(height: 32),
              TabBar(
                tabs: [
                  Tab(text: AppText.tabTitle),
                  Tab(text: AppText.tabTitle2),
                ],
              ),
              Flexible(
                child: TabBarView(
                  children: [OverviewTab(), SessionBookingTab()],
                ),
              ),
              const SizedBox(height: 20),
              Text(AppText.ratings),
            ],
          ),
        ),
      ),
    );
  }
}
