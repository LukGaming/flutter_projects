import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/testable_counter_widget.dart';

void main() {
  testWidgets(
      'TestableCounterWidget initializes with 0 and increments when button is pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TestableCounterWidget(),
        ),
      ),
    );

    expect(find.text('Counter value: 0'), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // Rebuild the widget

    expect(find.text('Counter value: 1'), findsOneWidget);
  });

  testWidgets('Counter increments multiple times', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TestableCounterWidget(),
        ),
      ),
    );

    expect(find.text('Counter value: 0'), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Counter value: 3'), findsOneWidget);
  });

  testWidgets('UI updates correctly when increment button is pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TestableCounterWidget(),
        ),
      ),
    );

    expect(find.text('Counter value: 0'), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Counter value: 1'), findsOneWidget);
    expect(find.text('Counter value: 0'), findsNothing);
  });
}
