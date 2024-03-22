class NewBooksEntity {
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  NewBooksEntity({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  factory NewBooksEntity.fromJson(Map<String, dynamic> json) {
    return NewBooksEntity(
      title: json['title'],
      subtitle: json['subtitle'],
      isbn13: json['isbn13'],
      price: json['price'],
      image: json['image'],
      url: json['url'],
    );
  }
}
