import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String id;
  final String name;
  final String avatar;
  final String city;
  final String country;
  final String county;
  final String addressNo;
  final String street;
  final String zipCode;
  final DateTime createdAt;

  const Person({
    required this.id,
    required this.name,
    required this.avatar,
    required this.city,
    required this.country,
    required this.county,
    required this.addressNo,
    required this.street,
    required this.zipCode,
    required this.createdAt,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: json['name'],
      avatar: '${json['avatar']}?${json['id']}',
      city: json['city'],
      country: json['country'],
      county: json['county'],
      addressNo: json['address_no'],
      street: json['street'],
      zipCode: json['zip_code'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  String get firstName => name.split(" ")[0];
  String get lastName {
    List<String> nameParts = name.split(' ');
    return nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
  }
  String get fullAddress => '$addressNo $street $county $zipCode $country';

  @override
  List<Object> get props => [
        id,
        name,
        avatar,
        city,
        country,
        county,
        addressNo,
        street,
        zipCode,
        createdAt,
      ];
}
