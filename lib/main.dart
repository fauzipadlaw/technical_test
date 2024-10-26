import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_list/presentation/screen/person_list_screen.dart';

import 'domain/person_repository.dart';
import 'presentation/bloc/person_bloc.dart';
import 'presentation/bloc/person_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Person Fetch List Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) =>
            PersonBloc(PersonRepository())..add(FetchPersons()),
        child: PersonListScreen(),
      ),
    );
  }
}
