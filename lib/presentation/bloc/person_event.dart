import 'package:equatable/equatable.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object> get props => [];
}

class FetchPersons extends PersonEvent {}

class SearchPersons extends PersonEvent {
  final String query;
  const SearchPersons(this.query);

  @override
  List<Object> get props => [query];
}
