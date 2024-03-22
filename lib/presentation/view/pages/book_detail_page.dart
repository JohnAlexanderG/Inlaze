import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Book Detail Page'),
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Book Detail Page!',
        ),
      ),
    );
  }
}
