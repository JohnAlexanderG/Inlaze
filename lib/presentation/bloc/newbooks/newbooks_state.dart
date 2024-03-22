part of 'newbooks_bloc.dart';

class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

// New Books

class NewBooksLoading extends BookState {}

class NewBooksLoaded extends BookState {
  final List<NewBooksEntity> books;

  const NewBooksLoaded({required this.books});

  @override
  List<Object> get props => [books];
}

class NewBooksError extends BookState {
  final String message;

  const NewBooksError({required this.message});

  @override
  List<Object> get props => [message];
}

// Book Details

class BookDetailsLoading extends BookState {}

class BookDetailsLoaded extends BookState {
  final List<BookDetailsEntity> bookDetails;

  const BookDetailsLoaded({required this.bookDetails});

  @override
  List<Object> get props => [bookDetails];
}

class BookDetailsError extends BookState {
  final String message;

  const BookDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}
