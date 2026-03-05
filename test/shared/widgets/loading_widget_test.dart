import 'package:code_forge/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildWidget({String? message}) {
    return MaterialApp(
      home: Scaffold(
        body: LoadingWidget(message: message),
      ),
    );
  }

  testWidgets('shows CircularProgressIndicator', (tester) async {
    await tester.pumpWidget(buildWidget());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows message when provided', (tester) async {
    await tester.pumpWidget(buildWidget(message: 'Loading problems...'));

    expect(find.text('Loading problems...'), findsOneWidget);
  });

  testWidgets('does not show message when not provided', (tester) async {
    await tester.pumpWidget(buildWidget());

    expect(find.byType(Text), findsNothing);
  });

  testWidgets('ShimmerListTile renders correctly', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ShimmerListTile(),
        ),
      ),
    );

    // ShimmerListTile has containers for skeleton loading
    expect(find.byType(Container), findsWidgets);
  });
}
