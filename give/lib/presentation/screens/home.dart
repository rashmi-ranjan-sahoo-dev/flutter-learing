import 'package:flutter/material.dart';
import '../widgets/common/appBar.dart';
import '../widgets/common/drawer.dart';
import '../widgets/hero_section.dart';
import "../widgets/give_monthly_section.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Give"),
      endDrawer: MenuDrawer(),
      body: SingleChildScrollView(
        child:Column(
        children: [
          SizedBox(height: 16.0),
          HeroSectionWidget(),
          SizedBox(height: 16.0),
          GiveMonthlySectionWidget(),
        ],
      ),)
    );
  }
}
