import 'package:flutter/material.dart';
import 'package:person_list/data/models/person_model.dart';
import 'package:person_list/utils/helper.dart';

class PersonCard extends StatelessWidget {
  final Person person;
  const PersonCard({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                person.avatar,
                height: 100.0,
              ),
            ),
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
    );
  }
}
