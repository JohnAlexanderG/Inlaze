import 'dart:convert';

import 'package:gannar/domain/entities/book_details_entity.dart';
import 'package:gannar/domain/entities/book_entity.dart';
import 'package:http/http.dart' as http;

class BookRemoteDataSource {
  final String baseUrl = 'https://api.itbook.store/1.0';

  Future<List<NewBooksEntity>> getNewBooks() async {
    final response = await http.get(Uri.parse('$baseUrl/new'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> booksJson = jsonData['books'];
      return booksJson.map((json) => NewBooksEntity.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load new books');
    }
  }

  Future<List<BookDetailsEntity>> getBookDetails({String isbn13 = ''}) async {
    final response = await http.get(Uri.parse('$baseUrl/books/$isbn13'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> booksJson = jsonData['books'];
      return booksJson.map((json) => BookDetailsEntity.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load new books');
    }
  }
}
