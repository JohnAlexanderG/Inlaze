import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gannar/domain/entities/book_entity.dart';
import 'package:gannar/presentation/bloc/newbooks/newbooks_bloc.dart';

class NewBooksList extends StatelessWidget {
  const NewBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is NewBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewBooksLoaded) {
          return SizedBox(
            height: 220.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                final NewBooksEntity book = state.books[index];
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<BookBloc>(context).add(
                      GetBookDetails(book.isbn13),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: SizedBox(
                      width: 150.0,
                      child: Column(
                        children: [
                          Image.network(book.image),
                          Text(
                            book.isbn13,
                            style: const TextStyle(fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is NewBooksError) {
          return Center(child: Text(state.message));
        } else {
          return Container();
        }
      },
    );
  }
}
