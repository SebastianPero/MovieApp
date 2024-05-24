import 'package:flutter/material.dart';
import 'package:movie_apllication/detail/movies_detail.dart';
import 'package:movie_apllication/screen/list_movies_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ListMovies.routeName,
      routes: {
        ListMovies.routeName: (context) => const ListMovies(),
        MoviesDetailScreen.routeName: (context) {
          final argument = ModalRoute.of(context)?.settings.arguments;

          if (argument is String) {
            return MoviesDetailScreen(
              id: argument,
            );
          } else {
            return Scaffold(
              appBar: AppBar(),
              body: const Text('Error'),
            );
          }
        }
      },
    );
  }
}
