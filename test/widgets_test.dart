import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_web_app/widgets/common_widgets.dart';

void main() {
  group('CustomCard', () {
    testWidgets('renders child widget correctly', (WidgetTester tester) async {
      const testText = 'Test Card Content';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCard(
              child: Text(testText),
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('applies custom padding', (WidgetTester tester) async {
      const customPadding = EdgeInsets.all(32.0);
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCard(
              padding: customPadding,
              child: Text('Test'),
            ),
          ),
        ),
      );

      final Padding paddingWidget = tester.widget(find.byType(Padding));
      expect(paddingWidget.padding, equals(customPadding));
    });

    testWidgets('applies custom elevation', (WidgetTester tester) async {
      const customElevation = 8.0;
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCard(
              elevation: customElevation,
              child: Text('Test'),
            ),
          ),
        ),
      );

      final Card card = tester.widget(find.byType(Card));
      expect(card.elevation, equals(customElevation));
    });
  });

  group('LoadingIndicator', () {
    testWidgets('renders circular progress indicator', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoadingIndicator(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays message when provided', (WidgetTester tester) async {
      const testMessage = 'Loading data...';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoadingIndicator(
              message: testMessage,
            ),
          ),
        ),
      );

      expect(find.text(testMessage), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('does not display message when not provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoadingIndicator(),
          ),
        ),
      );

      expect(find.byType(Text), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  group('ResponsiveContainer', () {
    testWidgets('renders child widget correctly', (WidgetTester tester) async {
      const testText = 'Responsive Content';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveContainer(
              child: Text(testText),
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('applies max width constraint', (WidgetTester tester) async {
      const customMaxWidth = 800.0;
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveContainer(
              maxWidth: customMaxWidth,
              child: Text('Test'),
            ),
          ),
        ),
      );

      final Container container = tester.widget(
        find.descendant(
          of: find.byType(ResponsiveContainer),
          matching: find.byType(Container),
        ),
      );
      
      expect(container.constraints?.maxWidth, equals(customMaxWidth));
    });

    testWidgets('applies custom padding', (WidgetTester tester) async {
      const customPadding = EdgeInsets.all(32.0);
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveContainer(
              padding: customPadding,
              child: Text('Test'),
            ),
          ),
        ),
      );

      final Container container = tester.widget(
        find.descendant(
          of: find.byType(ResponsiveContainer),
          matching: find.byType(Container),
        ),
      );
      
      expect(container.padding, equals(customPadding));
    });

    testWidgets('is centered in parent', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveContainer(
              child: Text('Test'),
            ),
          ),
        ),
      );

      expect(
        find.descendant(
          of: find.byType(ResponsiveContainer),
          matching: find.byType(Center),
        ),
        findsOneWidget,
      );
    });
  });
}
