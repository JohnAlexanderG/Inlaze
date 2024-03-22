import 'package:gannar/domain/entities/book_entity.dart';

class NewBooksModel extends NewBooksEntity {
  NewBooksModel({
    required super.title,
    required super.subtitle,
    required super.isbn13,
    required super.price,
    required super.image,
    required super.url,
  });

  factory NewBooksModel.fromJson(Map<String, dynamic> json) {
    return NewBooksModel(
      title: json['title'],
      subtitle: json['subtitle'],
      isbn13: json['isbn13'],
      price: json['price'],
      image: json['image'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'isbn13': isbn13,
      'price': price,
      'image': image,
      'url': url,
    };
  }
}
