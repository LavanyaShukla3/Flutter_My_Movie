import 'package:flutter/material.dart';
import 'package:my_movie/search_page_utilities/custom_elevated_button.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
          backgroundColor:Colors.white,
        centerTitle: true,
      ),

        body: const Column(

          children:<Widget>[
            TextField (
              decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Search for movies',
              icon: Icon(Icons.search),
          ),
        ),
            SizedBox(height: 20),
            Column(
            children:<Widget>[
            Row(
              children:<Widget> [
                //image:'assets/images/action.png',
                //image:'assets/images/comedy.png',

                Expanded(child: CustomButton(genre: "Action",colour:"blue", onTap:"Action"),),
                Expanded(child: CustomButton(genre:"Comedy",colour:"green", onTap:"Comedy"),),
              ],
            ),
              SizedBox(height: 10),
            Row(
              children:<Widget> [
                //image:'assets/images/detective.png',
                //image:'assets/images/horror.png',
                Expanded(child: CustomButton(genre:"Detective",colour:"red", onTap:"Detective"),),
                Expanded(child: CustomButton(genre:"Horror",colour:"grey", onTap:"Horror"),),
                ],
            ),
              SizedBox(height: 10),
            Row(
              children:<Widget> [
                //image:'assets/images/romance.png',
                //image:'assets/images/sci-fi.png',
                Expanded(child: CustomButton(genre:"Romance",colour:"pink", onTap:"Romance"),),
                Expanded(child: CustomButton(genre:"Sci-fi",colour:"teal", onTap:"Sci-fi"),),
              ],
            ),
            ],
            ),
    ]
    ),
    );
  }
}

