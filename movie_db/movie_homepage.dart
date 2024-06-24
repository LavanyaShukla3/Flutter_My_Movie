import 'package:flutter/material.dart';
import 'package:my_movie/utilities/constants.dart';
import 'package:my_movie/utilities/api_call.dart';
import 'package:my_movie/utilities/movie_model.dart';
import 'package:my_movie/utilities/build_movie_list.dart';
import 'package:my_movie/utilities/appbar.dart';
import 'package:my_movie/utilities/icon_button.dart';
import 'package:my_movie/utilities/now_playing_slider.dart';
import 'package:my_movie/utilities/popular_people.dart';

//movie homepage where list of movie present
// has options to search/navigate and create watchlist

class MovieHomepage extends StatefulWidget {
  const MovieHomepage({super.key});

  @override
  State<MovieHomepage> createState() => _MovieHomepageState();
}

class _MovieHomepageState extends State<MovieHomepage> {
  List<MovieModel> popularMoviesList = [];
  List<MovieModel> upcomingMoviesList = [];
  List<MovieModel> topRatedMoviesList = [];

  Future<void> fetchmovies() async {
    //to get info from tmdb
    var popularMovieResponse = await ApiCall(Constants.popular).getData();
    var upcomingMovieResponse = await ApiCall(Constants.upcoming).getData();
    var topRatedMovieResponse = await ApiCall(Constants.topRated).getData();

    setState(() {
      // to get access to result part from the response
      List<dynamic> popularMoviesResults = popularMovieResponse['results'];
      List<dynamic> upcomingMoviesResults = upcomingMovieResponse['results'];
      List<dynamic> topRatedMoviesResults = topRatedMovieResponse['results'];

      //putting each element in form movieModel
      for (var element in popularMoviesResults) {
        popularMoviesList.add(MovieModel.fromJson(element));
      }
      for (var element in upcomingMoviesResults) {
        upcomingMoviesList.add(MovieModel.fromJson(element));
      }
      for (var element in topRatedMoviesResults) {
        topRatedMoviesList.add(MovieModel.fromJson(element));
      }
    });
  }

  //to perform api call each time the page is opened
  @override
  void initState() {
    super.initState();
    fetchmovies();
  }

  @override
  Widget build(BuildContext context) {
    //calling fetchmovies() inside the build() method can lead to an undesirable behavior.
    // The build() method should be used solely for building the UI and not for initiating asynchronous operations.
    //fetchmovies();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(appBarTitle: 'mymovielist', icon: Icons.search),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
            //now playing movie slider
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: const NowPlayingMovies(),
            ),

            const SizedBox(height: 20.0),
            // Upcoming Movies
            BuildMovieList(
                title: "UPCOMING MOVIES", movieList: upcomingMoviesList),

            //const SizedBox(height: 20.0),
            // Popular Movies
            BuildMovieList(
                title: "POPULAR MOVIES", movieList: popularMoviesList),

            //const SizedBox(height: 20.0),
            // Top Rated Movies
            BuildMovieList(
                title: "TOP RANKED", movieList: topRatedMoviesList),

            //const SizedBox(height:20.0),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Row(
                children: <Widget>[
                  // No built-in icon for a straight line
                  Container(
                    width: 6.0,
                    height: 32.0, // Width of the vertical line
                    color: Colors.red,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    'POPULAR PEOPLE',
                    style:textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5.0, top: 10.0),
              height: 200.0, // Provide a specific height here
              child: const CelebritiesList(),
            ),
          ]))),
          Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50.0,
                    color: const Color.fromARGB(255, 245, 251, 254),
                    child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButtons(page: "MovieHomepage", icon: "home"),
                          //SizedBox(width: 80),
                          IconButtons(page: "searchPage", icon: "search"),
                          //SizedBox(width: 80),
                          IconButtons(
                              page: "navigationPage",
                              icon: "assistant_navigation"),
                          //SizedBox(width: 80),
                          IconButtons(page: "listPage", icon: "list"),
                          //SizedBox(width: 80),
                          IconButtons(
                              page: "userInfoPage",
                              icon: "supervised_user_circle"),
                        ]),
                  ))),
        ],
      ),
    );
  }
}
