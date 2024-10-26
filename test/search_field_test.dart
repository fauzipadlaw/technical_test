import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:person_list/presentation/widgets/search_field.dart';

void main() {
  testWidgets('SearchField displays UI elements and handles input',
      (WidgetTester tester) async {
    String changedText = '';
    void onChanged(String text) {
      changedText = text;
    }

    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchField(
            onChanged: onChanged,
            controller: controller,
          ),
        ),
      ),
    );

    expect(find.text('Search name'), findsOneWidget);

    expect(find.byIcon(Icons.search), findsOneWidget);

    expect(find.byIcon(Icons.clear), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'John Doe');
    await tester.pump();

    expect(changedText, 'John Doe');
    expect(controller.text, 'John Doe');

    await tester.tap(find.byIcon(Icons.clear));
    await tester.pump();

    expect(changedText, '');
    expect(controller.text, '');
  });
}
