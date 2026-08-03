import 'package:flutter/material.dart';
import '../widgets/common/appBar.dart';
import '../widgets/common/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Give"),
      endDrawer: MenuDrawer(),
    );
  }
}
