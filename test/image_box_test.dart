import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:person_list/presentation/widgets/image_box.dart';

void main() {
  testWidgets('ImageBox displays CachedNetworkImage',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ImageBox(
              url: 'https://example.com/image.png',
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });
  });
}
