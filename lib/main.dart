import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gannar/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:gannar/presentation/view/pages/book_detail_page.dart';
import 'package:gannar/presentation/view/pages/home_page.dart';
import 'package:gannar/presentation/view/pages/login_page.dart';
import 'package:gannar/presentation/view/pages/settings_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(
            primary: Colors.black,
            secondary: Colors.white,
            error: Colors.redAccent,
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 14.0),
          ),
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state.isAuthenticated) {
              return const HomePage();
            } else {
              return const LoginPage();
            }
          },
        ),
        routes: {
          '/home': (context) => const HomePage(),
          '/login': (context) => const LoginPage(),
          '/settings': (context) => const SettingsPage(),
          '/book-detail': (context) => const BookDetailPage(),
        },
      ),
    );
  }
}
