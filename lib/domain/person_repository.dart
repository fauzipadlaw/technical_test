import '../data/models/person_model.dart';
import '../data/providers/person_api_provider.dart';

class PersonRepository {
  final PersonApiProvider _apiProvider = PersonApiProvider();

  Future<List<Person>> getPersons() {
    return _apiProvider.fetchPersons();
  }
}
