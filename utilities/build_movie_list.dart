import 'package:flutter/material.dart';
import 'package:my_movie/utilities/movie_tile.dart';
import 'package:my_movie/utilities/movie_model.dart';
import 'package:my_movie/utilities/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildMovieList extends StatelessWidget {
  const BuildMovieList({ Key? key,required this.title, required this.movieList}): super(key: key);
  final String title;
  final List<MovieModel> movieList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Movie category Title
        Padding(
          padding: const EdgeInsets.only(bottom: 22.0, left: 8.0),
          child: Row(
            children: <Widget>[
              // No built-in icon for a straight line
              Container(
                width: 6.0,
                height: 32.0, // Width of the vertical line
                color: Colors.red,
              ),
              const SizedBox(width: 10.0),
              // movie list name
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: textTheme.bodyLarge,
                    ),

                    GestureDetector(
                      onTap: () {
                        // Handle the 'VIEW ALL' tap event here
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 13.0),
                        child: Text(
                          'VIEW ALL',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // List View
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: ListView.builder(
            itemCount: movieList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemExtent: 120.0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Handle the movie item tap event here
                },
                child: MovieTile(movieIndex: index, movieList: movieList),
              );
            },
          ),
        ),
      ],
    );
  }
}
