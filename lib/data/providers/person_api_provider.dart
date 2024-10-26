import 'package:dio/dio.dart';
import '../models/person_model.dart';

class PersonApiProvider {
  final Dio _dio = Dio();

  Future<List<Person>> fetchPersons() async {
    final response = await _dio
        .get('https://66b197c51ca8ad33d4f482c9.mockapi.io/getData/test');
    return (response.data as List)
        .map((json) => Person.fromJson(json))
        .toList();
  }
}
