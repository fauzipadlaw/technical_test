import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_list/utils/helper.dart';

import '../bloc/person_bloc.dart';
import '../bloc/person_state.dart';

class PersonListScreen extends StatelessWidget {
  const PersonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People List'),
      ),
      body: BlocBuilder<PersonBloc, PersonState>(
        builder: (context, state) {
          if (state is PersonLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PersonLoaded) {
            return ListView.builder(
              itemCount: state.persons.length,
              itemBuilder: (context, index) {
                final person = state.persons[index];
                return ListTile(
                  leading: Image.network(
                      '${person.avatar}?${DateTime.now().millisecondsSinceEpoch.toString()}'),
                  title: Text(person.name),
                  subtitle: Text(Helper.humanizeDate(person.createdAt)),
                );
              },
            );
          } else if (state is PersonError) {
            return Center(
                child: Text('Failed to fetch data: ${state.message}'));
          }
          return const Center(child: Text('No data'));
        },
      ),
    );
  }
}
