import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie_response.dart';
import 'package:netflix_clone/models/popular_movie_response.dart';
import 'package:netflix_clone/screens/search_screen.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/custom_carousel_widget.dart';
import 'package:netflix_clone/widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var apiServices = ApiServices();
  late Future<MovieResponse> upcomingMovies;
  late Future<MovieResponse> nowPlayingMovies;
  late Future<PopularMovieResponse> popularMovies;

  @override
  void initState() {
    upcomingMovies = apiServices.getUpcomingMovies();
    nowPlayingMovies = apiServices.getNowPlayingMovies();
    popularMovies = apiServices.getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset("assets/logo.png", height: 50, width: 120),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SearchScreen(),
                ),
              );
            },
            icon: Icon(Icons.search, color: Colors.white, size: 30),
          ),
          SizedBox(width: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(color: Colors.blue, width: 25, height: 25),
          ),
          SizedBox(width: 5),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            CustomCarouselWidget(future: popularMovies),
            SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: MovieCardWidget(
                future: nowPlayingMovies,
                headLine: "Now Playing",
              ),
            ),

            SizedBox(height: 10),

            SizedBox(
              height: 250,
              child: MovieCardWidget(
                future: upcomingMovies,
                headLine: "Upcoming Movies",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
