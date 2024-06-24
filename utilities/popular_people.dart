import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_movie/utilities/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Celebrity {
  final String name;
  final String profilePath;

  const Celebrity({required this.name, required this.profilePath,});
}

class CelebritiesList extends StatefulWidget {
  const CelebritiesList({super.key});

  @override
  CelebritiesListState createState() => CelebritiesListState();

}

class CelebritiesListState extends State<CelebritiesList> {
  List<Celebrity> celebrities = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {

    final response = await http.get(Uri.parse(Constants.popularPeople));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'];

      setState(() {
        celebrities = results.map<Celebrity>((result) {
          return Celebrity(
            name: result['name'],
            profilePath: result['profile_path'],
          );
        }).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: celebrities.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final celebrity = celebrities[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CelebrityCard(
              name: celebrity.name,
              profilePath: celebrity.profilePath,
            ),
          );
        },
      ),
    );
  }
}

class CelebrityCard extends StatelessWidget {
  final String name;
  final String profilePath;

  const CelebrityCard({super.key, required this.name, required this.profilePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 45.0,
          backgroundImage: NetworkImage(
            'https://image.tmdb.org/t/p/w200$profilePath',
          ),
        ),
        const SizedBox(height: 10.0),

        SizedBox(
          width: 45.0,
          child: Text(
            name,
            style: GoogleFonts.nunito(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            softWrap: true,
            // Allow text to wrap to the next line
            overflow: TextOverflow.ellipsis,
            // Overflow behavior if text doesn't fit
            maxLines: 2,
            textAlign: TextAlign
                .center, // Align text to the center of the avatar
          ),
        ),
      ],
    );
  }
}