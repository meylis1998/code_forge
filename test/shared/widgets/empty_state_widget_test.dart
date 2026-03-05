import 'package:code_forge/shared/widgets/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildWidget({
    IconData icon = Icons.inbox,
    String title = 'No items',
    String? subtitle,
    Widget? action,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: EmptyStateWidget(
          icon: icon,
          title: title,
          subtitle: subtitle,
          action: action,
        ),
      ),
    );
  }

  testWidgets('renders icon and title', (tester) async {
    await tester.pumpWidget(buildWidget());

    expect(find.byIcon(Icons.inbox), findsOneWidget);
    expect(find.text('No items'), findsOneWidget);
  });

  testWidgets('renders subtitle when provided', (tester) async {
    await tester.pumpWidget(buildWidget(subtitle: 'Try again later'));

    expect(find.text('Try again later'), findsOneWidget);
  });

  testWidgets('does not render subtitle when not provided', (tester) async {
    await tester.pumpWidget(buildWidget());

    expect(find.text('Try again later'), findsNothing);
  });

  testWidgets('renders action widget when provided', (tester) async {
    await tester.pumpWidget(
      buildWidget(
        action: const ElevatedButton(
          onPressed: null,
          child: Text('Retry'),
        ),
      ),
    );

    expect(find.text('Retry'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
