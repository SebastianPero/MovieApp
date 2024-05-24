import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_apllication/data/model_movies.dart';
import 'package:movie_apllication/detail/movies_detail.dart';

class MoviesCard extends StatelessWidget {
  final List<Result> movies;
  const MoviesCard({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            child: _buildItemMovie(movie),
            onTap: () {
              Navigator.pushNamed(context, MoviesDetailScreen.routeName,
                  arguments: "${movie.id}");
            },
          );
        },
      ),
    );
  }

  Widget _buildItemMovie(Result movies) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8, left: 8),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w500/${movies.posterPath}',
              fit: BoxFit.fill,
              height: 200,
              width: 150,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Container(
            width: 150,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(242, 242, 242, 0.8),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 10,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: Color.fromARGB(255, 226, 207, 30),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        movies.voteAverage!.toStringAsFixed(1),
                      ),
                    ],
                  ),
                  Text(
                    '${movies.originalTitle}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('${movies.releaseDate}'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
