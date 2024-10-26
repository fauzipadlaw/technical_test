import 'package:intl/intl.dart';

import '../data/models/person_model.dart';
import 'package:faker/faker.dart' as fake;

class Helper {
  static String humanizeDate(DateTime datetime) {
    final DateFormat formatter = DateFormat('dd MMM yyy');
    return formatter.format(datetime);
  }

  static Person fakePerson() {
    final faker = fake.Faker();
    return Person(
        id: '',
        name: faker.person.name(),
        avatar: '',
        city: '',
        country: '',
        county: '',
        addressNo: '',
        street: '',
        zipCode: '',
        createdAt: faker.date.dateTime());
  }
}
