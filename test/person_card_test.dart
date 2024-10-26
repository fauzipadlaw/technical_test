import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:person_list/presentation/bloc/person_state.dart';
import 'package:person_list/presentation/widgets/image_box.dart';
import 'package:person_list/presentation/widgets/person_card.dart';
import 'package:person_list/utils/helper.dart';

void main() {
  testWidgets('PersonCard displays person information and navigates on tap',
      (WidgetTester tester) async {
    final person = Helper.fakePerson();

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PersonCard(
              person: person,
              state: PersonLoaded([person]),
            ),
          ),
        ),
      );
    });

    await tester.pump(const Duration(milliseconds: 10));

    expect(find.text(person.name), findsOneWidget);

    expect(find.text(Helper.humanizeDate(person.createdAt)), findsOneWidget);

    expect(find.byType(ImageBox), findsOneWidget);
  });
}
