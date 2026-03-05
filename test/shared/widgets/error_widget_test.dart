import 'package:code_forge/shared/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildWidget({
    String message = 'Something went wrong',
    VoidCallback? onRetry,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: AppErrorWidget(
          message: message,
          onRetry: onRetry,
        ),
      ),
    );
  }

  testWidgets('renders error message', (tester) async {
    await tester.pumpWidget(buildWidget());

    expect(find.text('Something went wrong'), findsOneWidget);
  });

  testWidgets('shows retry button when onRetry provided', (tester) async {
    await tester.pumpWidget(buildWidget(onRetry: () {}));

    expect(find.text('Retry'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('hides retry button when onRetry is null', (tester) async {
    await tester.pumpWidget(buildWidget());

    expect(find.text('Retry'), findsNothing);
    expect(find.byType(ElevatedButton), findsNothing);
  });

  testWidgets('calls onRetry when retry button tapped', (tester) async {
    var tapped = false;
    await tester.pumpWidget(buildWidget(onRetry: () => tapped = true));

    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();

    expect(tapped, true);
  });
}
