part of 'newbooks_bloc.dart';

class BookEvent {
  const BookEvent();
}

class GetNewBooks extends BookEvent {}

class GetBookDetails extends BookEvent {
  final String isbn13;
  GetBookDetails(this.isbn13);
}
