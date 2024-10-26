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
        emit(PersonLoaded(persons));
      } catch (e) {
        emit(PersonError(e.toString()));
      }
    });
  }
}
