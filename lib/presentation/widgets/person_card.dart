import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:person_list/data/models/person_model.dart';
import 'package:person_list/presentation/widgets/image_box.dart';
import 'package:person_list/utils/helper.dart';

class PersonCard extends StatelessWidget {
  final Person person;
  const PersonCard({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Animate(
            effects: const [FadeEffect(), ScaleEffect()],
            child: Row(
              children: [
                ImageBox(url: person.avatar),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        person.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        Helper.humanizeDate(person.createdAt),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
