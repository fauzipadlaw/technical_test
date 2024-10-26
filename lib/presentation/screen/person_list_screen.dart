import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_list/presentation/widgets/person_card.dart';
import 'package:person_list/presentation/widgets/search_field.dart';
import 'package:person_list/utils/helper.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../bloc/person_bloc.dart';
import '../bloc/person_event.dart';
import '../bloc/person_state.dart';

class PersonListScreen extends StatelessWidget {
  PersonListScreen({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People List'),
      ),
      body: Column(
        children: [
          SearchField(
            controller: _controller,
            onChanged: (query) =>
                BlocProvider.of<PersonBloc>(context).add(SearchPersons(query)),
          ),
          Expanded(
            child: BlocBuilder<PersonBloc, PersonState>(
              builder: (context, state) {
                if (state is PersonLoading || state is PersonLoaded) {
                  return Skeletonizer(
                    enabled: state is PersonLoading,
                    child: ListView.builder(
                      itemCount:
                          state is PersonLoaded ? state.persons.length : 10,
                      itemBuilder: (context, index) {
                        final person = state is PersonLoaded
                            ? state.persons[index]
                            : Helper.fakePerson();
                        return PersonCard(person: person);
                      },
                    ),
                  );
                } else if (state is PersonError) {
                  return Center(
                      child: Text('Failed to fetch data: ${state.message}'));
                }

                return const Center(child: Text('No data'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
