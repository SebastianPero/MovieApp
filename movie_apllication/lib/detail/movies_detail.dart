import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_apllication/data/api/api_services_movie.dart';
import 'package:movie_apllication/data/model_movies.dart';
import 'package:movie_apllication/helper/result_state.dart';
import 'package:movie_apllication/provider/movie/get_detail_provider.dart';
import 'package:provider/provider.dart';

class MoviesDetailScreen extends StatelessWidget {
  static const routeName = '/movies_detail';
  final String id;
  const MoviesDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetDetailMoviesProvider>(
      create: (context) {
        return GetDetailMoviesProvider(id, apiService: ApiServicesMovie());
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Detail Movies"),
        ),
        body: Consumer<GetDetailMoviesProvider>(
          builder: (context, provider, child) {
            switch (provider.state) {
              case ResultState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ResultState.hasData:
                return SafeArea(
                  child: DetailContentMovie(
                    movie: provider.movies,
                  ),
                );
              case ResultState.noData:
              case ResultState.error:
                return Center(
                  child: Text(provider.message),
                );
            }
          },
        ),
      ),
    );
  }
}

class DetailContentMovie extends StatelessWidget {
  final Result movie;

  const DetailContentMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 150.0),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${movie.title}",
                              style: const TextStyle(fontSize: 20.0),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.star_outline,
                                      color: Colors.yellow[700],
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(movie.voteAverage!.toStringAsFixed(1)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Icon(Icons.calendar_month),
                                    const SizedBox(height: 5.0),
                                    Text("${movie.releaseDate}")
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Icon(Icons.rate_review_outlined),
                                    const SizedBox(height: 5.0),
                                    Text(movie.popularity!.toStringAsFixed(1))
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Deskripsi : ",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  "${movie.overview}",
                                  textAlign: TextAlign.justify,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
