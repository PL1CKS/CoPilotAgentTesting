import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/screens/home_page.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the welcome text is present
    expect(find.text('Welcome to Flutter Web!'), findsOneWidget);
    expect(find.text('Click Me'), findsOneWidget);

    // Tap the button and trigger a frame.
    await tester.tap(find.text('Click Me'));
    await tester.pump();

    // Verify that the snackbar message appears
    expect(find.text('Button pressed!'), findsOneWidget);
  });

  testWidgets('HomePage has correct widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // Verify AppBar
    expect(find.text('Flutter Web App'), findsOneWidget);
    
    // Verify web icon
    expect(find.byIcon(Icons.web), findsOneWidget);
    
    // Verify description text
    expect(
      find.text('This is a Flutter web application built with best practices.'),
      findsOneWidget,
    );
    
    // Verify button
    expect(find.widgetWithIcon(ElevatedButton, Icons.touch_app), findsOneWidget);
  });

  testWidgets('Theme is properly configured', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final MaterialApp app = tester.widget(find.byType(MaterialApp));
    
    // Verify theme configuration
    expect(app.theme, isNotNull);
    expect(app.darkTheme, isNotNull);
    expect(app.themeMode, ThemeMode.system);
    expect(app.debugShowCheckedModeBanner, false);
  });
}
