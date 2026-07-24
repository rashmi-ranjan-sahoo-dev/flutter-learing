import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'data/mock_campaigns.dart';

void main() {
  runApp(const GiveApp());
}

class GiveApp extends StatelessWidget {
  const GiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CareBridge',
      theme: AppTheme.lightTheme,
      home: const SetupCheckScreen(),
    );
  }
}

class SetupCheckScreen extends StatelessWidget {
  const SetupCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final campaign = mockCampaigns.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CareBridge'),
      ),
      body: Center(
        child: Text(
          'Setup complete!\\n\\nMock campaign: ${campaign.title}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}