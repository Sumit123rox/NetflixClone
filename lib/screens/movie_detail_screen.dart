import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/popular_movie_response.dart';
import 'package:netflix_clone/services/api_services.dart';

class MovieDetailScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Future<MovieModel> future;
  late Future<PopularMovieResponse> similarMoviesfuture;
  var apiServices = ApiServices();

  @override
  void initState() {
    future = apiServices.getMovieById(widget.movieId);
    similarMoviesfuture = apiServices.getSimilarMovies(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            MovieModel data = snapshot.data!;
            String genreText = data.genres.map((e) => e.name).join(", ");
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  expandedHeight: MediaQuery.of(context).size.height * 0.4,
                  flexibleSpace: FlexibleSpaceBar(
                    background: CachedNetworkImage(
                      imageUrl: '$imageUrlOriginal${data.backdropPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(10),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Text(
                        data.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            data.releaseDate.year.toString(),
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              genreText,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        data.overview,
                        style: const TextStyle(fontSize: 17),
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 30),
                      FutureBuilder(
                        future: similarMoviesfuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var similar = snapshot.data!.results;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("More like this"),
                                SizedBox(height: 10),
                                SizedBox(
                                  height: 200,
                                  // Fixed height for horizontal list
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: similar.length,
                                    itemBuilder: (context, index) {
                                      final movie = similar[index];
                                      final imagePath =
                                          movie.posterPath != null &&
                                                  movie.posterPath.isNotEmpty
                                              ? movie.posterPath
                                              : movie.backdropPath;
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (BuildContext context) =>
                                                      MovieDetailScreen(
                                                        movieId: movie.id,
                                                      ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 150,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 5,
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  '$imageUrlCustom$imagePath',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ]),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
