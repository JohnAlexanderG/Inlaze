import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gannar/data/datasources/book_remote_data_source.dart';
import 'package:gannar/domain/entities/book_details_entity.dart';
import 'package:gannar/domain/entities/book_entity.dart';

part 'newbooks_event.dart';
part 'newbooks_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRemoteDataSource remoteDataSource = BookRemoteDataSource();

  BookBloc() : super(const BookState()) {
    on<BookEvent>((event, emit) async {
      if (event is GetNewBooks) {
        try {
          emit(NewBooksLoading());
          final books = await remoteDataSource.getNewBooks();
          emit(NewBooksLoaded(books: books));
        } catch (e) {
          emit(NewBooksError(message: 'Failed to load new books: $e'));
        }
      }
      if (event is GetBookDetails) {
        try {
          emit(BookDetailsLoading());
          final bookDetails =
              await remoteDataSource.getBookDetails(isbn13: event.isbn13);
          emit(BookDetailsLoaded(bookDetails: bookDetails));
        } catch (e) {
          emit(BookDetailsError(message: 'Failed to load new books: $e'));
        }
      }
    });
  }
}
