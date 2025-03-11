import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/popular_movie_response.dart';
import 'package:netflix_clone/screens/movie_detail_screen.dart';

class CustomCarouselWidget extends StatelessWidget {
  final Future<PopularMovieResponse> future;

  const CustomCarouselWidget({super.key, required this.future});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data?.results;
          return SizedBox(
            width: size.width,
            height: (size.height * 0.33 < 300 ? 300 : size.height * 0.33),
            child: CarouselSlider.builder(
              itemCount: data?.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                var url = data?[index].backdropPath;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MovieDetailScreen(movieId: data[index].id,),
                      ),
                    );
                  },
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: "$imageUrlOriginal$url",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          placeholder:
                              (context, url) => Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: const CircularProgressIndicator(),
                                ),
                              ),
                          errorWidget:
                              (context, url, error) => const Icon(Icons.error),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                                colors: [
                                  Colors.black.withValues(alpha: 0.8),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 12,
                          right: 12,
                          bottom: 12,
                          child: Text(
                            data![index].originalTitle,
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 20,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: (size.height * 0.33 < 300 ? 300 : size.height * 0.33),
                aspectRatio: 16 / 9,
                initialPage: 0,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
