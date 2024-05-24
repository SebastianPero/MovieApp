import 'package:flutter/material.dart';
import 'package:movie_apllication/page/movie/now_playing_page.dart';
import 'package:movie_apllication/page/movie/populer_page.dart';
import 'package:movie_apllication/page/movie/top_rated_page.dart';
import 'package:movie_apllication/page/movie/upcomming_page.dart';

class ListMovies extends StatefulWidget {
  static const routeName = '/movies_list';
  const ListMovies({super.key});

  @override
  State<ListMovies> createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMovies> {
  int _curentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                textAlign: TextAlign.left,
                'Now Playing',
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            NowPlayingPage(),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                textAlign: TextAlign.left,
                'Populer',
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            PopulerPage(),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                textAlign: TextAlign.left,
                'Top Rated',
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TopRatedPage(),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                textAlign: TextAlign.left,
                'Upcomming',
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            UpcommingPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curentindex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie,
            ),
            label: "Movie",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.tv,
            ),
            label: "Tv",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "People",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Search",
          )
        ],
        onTap: (index) {
          setState(() {
            _curentindex = index;
          });
        },
      ),
    );
  }
}
