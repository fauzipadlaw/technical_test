import 'package:person_list/data/models/person_model.dart';

class FakePerson extends Person {
  const FakePerson({
    super.id = '',
    super.name = 'Fake Person',
    super.avatar =
        'https://loremflickr.com/cache/resized/65535_53046981914_cf878f713a_c_640_480_nofilter.jpg',
    super.city = '',
    super.country = '',
    super.county = '',
    super.addressNo = '',
    super.street = '',
    super.zipCode = '',
    required super.createdAt,
  });
}
