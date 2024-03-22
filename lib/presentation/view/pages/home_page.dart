import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gannar/presentation/bloc/newbooks/newbooks_bloc.dart';
import 'package:gannar/presentation/view/widgets/new_books_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/settings');
        },
        child: const Icon(Icons.settings),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 18.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/gannar_logo.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                  '¿Tienes un libro específico en mente? Usa nuestro buscador e ingresa el nombre del libro que deseas encontrar. Te mostraremos una lista de libros que coincidan con tu búsqueda.'),
              const SizedBox(height: 20),
              TextField(
                onChanged: (query) {
                  print(query);
                  // searchBloc.add(SearchQueryChanged(query));
                },
                decoration: const InputDecoration(
                  hintText: 'Search...',
                ),
              ),
              const SizedBox(height: 20),
              const Text('Aqui resultados...'),
              const SizedBox(height: 20),
              const Text(
                  'Descubre los libros más recientes con solo deslizar el dedo.'),
              const SizedBox(height: 20),
              BlocProvider(
                create: (_) => BookBloc()..add(GetNewBooks()),
                child: const NewBooksList(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
