import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/person_repository.dart';
import 'person_event.dart';
import 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepository repository;

  PersonBloc(this.repository) : super(PersonInitial()) {
    on<FetchPersons>((event, emit) async {
      emit(PersonLoading());
      try {
        final persons = await repository.getPersons();
        emit(persons.isNotEmpty ? PersonLoaded(persons) : PersonLoadedEmpty());
      } catch (e) {
        emit(PersonError(e.toString()));
      }
    });

    on<SearchPersons>((event, emit) async {
      emit(PersonLoading());
      try {
        final persons = await repository.getPersons();
        final filteredPersons = persons
            .where((person) =>
                person.name.toLowerCase().contains(event.query.toLowerCase()))
            .toList();
        emit(filteredPersons.isNotEmpty
            ? PersonLoaded(filteredPersons)
            : PersonLoadedEmpty());
      } catch (e) {
        emit(PersonError(e.toString()));
      }
    });
  }
}
