import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:give/presentation/widgets/faq_section.dart';

void main() {
  testWidgets('FAQ section expands and collapses through Riverpod state', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: Scaffold(body: FaqSection())),
      ),
    );
    await tester.pump();

    expect(find.text('Frequently Asked Questions'), findsOneWidget);
    expect(find.text('How can I support a cause?'), findsOneWidget);

    await tester.ensureVisible(find.text('How can I support a cause?'));
    await tester.tap(find.text('How can I support a cause?'));
    await tester.pump(const Duration(milliseconds: 250));

    expect(
      find.textContaining(
        'You can make a one-time donation or become a monthly donor.',
      ),
      findsOneWidget,
    );

    await tester.tap(find.text('How can I support a cause?'));
    await tester.pump(const Duration(milliseconds: 250));

    expect(
      find.textContaining(
        'You can make a one-time donation or become a monthly donor.',
      ),
      findsOneWidget,
    );
  });
}
