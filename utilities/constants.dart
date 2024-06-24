import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


var ksizedbox=  const SizedBox(height: 20,);

class Constants
{
//use static to use it directly
  static  String apiKey = '7c0d4bbc56c508ed898daf55dd6cad5a';
  static  String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3YzBkNGJiYzU2YzUwOGVkODk4ZGFmNTVkZDZjYWQ1YSIsInN1YiI6IjY0ZjE4MDI3Y2FhNTA4MDEyYjA2YmFkMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.aT4qRVGUV_ETaSpmoCpMxubMDrh9h7IOuyJw6voqTcU';
  static String imagePathPrefix = 'https://image.tmdb.org/t/p/w500/';
  static String popular = 'http://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}&sort_by=popularity.desc';
  static String upcoming = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static String topRated = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';



  static String nowPlayingMovies = 'https://api.themoviedb.org/3/movie/now_playing?api_key=7c0d4bbc56c508ed898daf55dd6cad5a';
  static String popularPeople = 'https://api.themoviedb.org/3/person/popular?api_key=7c0d4bbc56c508ed898daf55dd6cad5a';
  static String peopledescription = 'https://api.themoviedb.org/3/person/ ';

  static Map<int, String> genreMap = {
    28: 'Action',
    12: 'Adventure',
    16: 'Animation',
    35: 'Comedy',
    80: 'Crime',
    99: 'Documentary',
    18: 'Drama',
    10751: 'Family',
    14: 'Fantasy',
    36: 'History',
    27: 'Horror',
    10402: 'Music',
    9648: 'Mystery',
    10749: 'Romance',
    878: 'Science Fiction',
    10770: 'TV Movie',
    53: 'Thriller',
    10752: 'War',
    37: 'Western',
  };
}
class ErrorMessages {
  ErrorMessages._privateConstructor();

  static const unauthorized = 'You are not authorized';
  static const noInternet = 'Please check your internet connection';
  static const connectionTimeout = 'Please check your internet connection';
  static const networkGeneral = 'Something went wrong. Please try again later.';
  static const invalidPhone = 'Invalid Mobile number';
  static const invalidOTP = 'Invalid OTP';
  static const invalidName = 'Invalid Name';
  static const invalidEmail = 'Invalid Email';
  static const confirmPassword = 'Passwords do NOT match';
  static const invalidUsername = 'Name requires at least 3 characters';
  static const weakPassword = 'Password requires at least 3 characters';
  static const emailAlreadyRegistered = 'The account already exists for that email';
  static const invalidUser ='No user found for that email';
}

TextTheme textTheme = TextTheme(
  //My movie list - registration page
  displayLarge: GoogleFonts.pathwayGothicOne(
    fontWeight: FontWeight.w800,
    color: Colors.white,
    fontSize: 37.sp,
  ),
  //appbar
  displayMedium:GoogleFonts.signika(
    color: Colors.red,
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
  ),
  // movie genre title
  bodyLarge: TextStyle(
    fontSize: 17.sp,
    color: Colors.black,
    fontWeight: FontWeight.w300,
  ),

  //skip
  titleLarge:TextStyle(
    fontSize: 17.sp,
    color: Colors.white,
    fontWeight: FontWeight.w300,
  ),

  //slider's movie name
  displaySmall:GoogleFonts.signika(
    color: Colors.black,
    fontSize: 27.sp,
    fontWeight: FontWeight.w400,
  ),

  //movie name + slider's movie genre
  bodyMedium: GoogleFonts.nunito(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  ),


  // skip - registration page
  titleMedium: GoogleFonts.nunito(
    fontWeight: FontWeight.w200,
    color: Colors.white,
    fontSize: 21.sp,
  ),

  headlineMedium : TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22.sp,
      color: Colors.black
  ),

// ),

);