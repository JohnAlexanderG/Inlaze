import 'package:gannar/domain/entities/book_details_entity.dart';

class BookDetailsModel extends BookDetailsEntity {
  BookDetailsModel({
    required super.error,
    required super.title,
    required super.subtitle,
    required super.authors,
    required super.publisher,
    required super.language,
    required super.isbn10,
    required super.isbn13,
    required super.pages,
    required super.year,
    required super.rating,
    required super.desc,
    required super.price,
    required super.image,
    required super.url,
  });

  factory BookDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookDetailsModel(
      error: json['error'],
      title: json['title'],
      subtitle: json['subtitle'],
      authors: json['authors'],
      publisher: json['publisher'],
      language: json['language'],
      isbn10: json['isbn10'],
      isbn13: json['isbn13'],
      pages: json['pages'],
      year: json['year'],
      rating: json['rating'],
      desc: json['desc'],
      price: json['price'],
      image: json['image'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'publisher': publisher,
      'language': language,
      'isbn10': isbn10,
      'isbn13': isbn13,
      'pages': pages,
      'year': year,
      'rating': rating,
      'desc': desc,
      'price': price,
      'image': image,
      'url': url,
    };
  }
}
