import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:person_list/presentation/widgets/detail_card_row.dart';
import 'package:person_list/presentation/widgets/image_box.dart';

import '../../data/models/person_model.dart';

class PersonDetailScreen extends StatelessWidget {
  final Person person;
  const PersonDetailScreen({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Animate(
                  effects: const [
                    FadeEffect(),
                    ScaleEffect(),
                  ],
                  child: ImageBox(
                    url: person.avatar,
                    borderRadius: 100,
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DetailCardRow(
                title: 'First Name',
                content: person.firstName,
              ),
              DetailCardRow(
                title: 'Last Name',
                content: person.lastName,
              ),
              DetailCardRow(
                title: 'Address',
                content: person.fullAddress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
