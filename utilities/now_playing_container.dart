import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_movie/utilities/constants.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key,required this.url, required this.movieTitle, required this.genres}) : super(key: key);

  final String url;
  final String movieTitle;
  final String genres;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          // Original content here
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Blurred container
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.white, // White at the bottom
                  Colors.white.withOpacity(0.0), // Transparent at the top
                ],
                stops: const [0.0, 0.6], // Color stops
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                movieTitle,
                style: textTheme.displaySmall,
              ),
              Row(
                children:<Widget>[
                Text(
                  '2023',
                    style: textTheme.bodyMedium,),
              const SizedBox(width:4.0),
              const FaIcon(FontAwesomeIcons.solidCircle,size: 4.0, color: Colors.black,),
                  const SizedBox(width:4.0),

              Text(
                genres, // Display the genre name here
                style: textTheme.bodyMedium,),

            ],),
        ],),
    ),
    ]);
  }
}
