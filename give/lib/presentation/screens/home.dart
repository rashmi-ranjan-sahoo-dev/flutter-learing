import 'package:flutter/material.dart';
import '../widgets/common/app_bar.dart';
import '../widgets/common/drawer.dart';
import '../widgets/hero_section.dart';
import '../widgets/give_monthly_section.dart';
import '../widgets/donation_section.dart';
import '../widgets/fundrais_section.dart';
import '../widgets/ngo_section.dart';
import '../widgets/partner_testimonials_section.dart';
import '../widgets/blog_section.dart';
import '../widgets/faq_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Give'),
      endDrawer: const MenuDrawer(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxContentWidth = constraints.maxWidth > 1200
                ? 1200.0
                : constraints.maxWidth;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxContentWidth),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      HeroSectionWidget(),
                      SizedBox(height: 20),
                      GiveMonthlySectionWidget(),
                      SizedBox(height: 20),
                      DonationWidget(),
                      SizedBox(height: 20),
                      FundraiserSection(),
                      SizedBox(height: 20),
                      NgoSectionWidget(),
                      PartnerTestimonialsSection(),
                      BlogSection(),
                      FaqSection(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
