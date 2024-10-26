import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:person_list/presentation/widgets/detail_card_row.dart';

void main() {
  testWidgets('DetailCardRow displays title and content',
      (WidgetTester tester) async {
    const testTitle = 'Test Title';
    const testContent = 'Test Content';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DetailCardRow(
            title: testTitle,
            content: testContent,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text(testTitle), findsOneWidget);

    expect(find.text(testContent), findsOneWidget);
  });
}
