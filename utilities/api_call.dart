import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCall {
  static const String imagePathPrefix = 'https://image.tmdb.org/t/p/w500/';

  //pass url of the movies
  final String url;
  ApiCall(this.url);

  // Fetch data from API
  Future<Map<String, dynamic>> getData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      return responseBody;
    } else {
      // If the API call failed, throw an exception or handle the error accordingly
      throw Exception('Failed to load data from API');
    }
  }
}
