import 'package:flutter/material.dart';
import 'package:my_movie/movie_db/list_page.dart';
import 'package:my_movie/movie_db/navigation_page.dart';
import 'package:my_movie/movie_db/search_page.dart';
import 'package:my_movie/movie_db/userinfo_page.dart';
import 'package:my_movie/movie_db/movie_homepage.dart';

class IconButtons extends StatefulWidget {
  const IconButtons({ Key? key,required this.page, required this.icon}) : super(key: key);
  final String page;
  final String icon;

  @override
  State<IconButtons> createState() => _IconButtonsState();
}

class _IconButtonsState extends State<IconButtons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => getPage(),
          ),
        );
      },
      child: getIcon(),
    );
  }

  Widget getPage() {
    switch (widget.page) {
      case "movie_Homepage":
        return const MovieHomepage();
      case "searchPage":
        return const SearchPage();
      case "navigationPage":
        return const NavigationPage();
      case "listPage":
        return const ListPage();
      case "userInfoPage":
        return const UserInfoPage();
      default:
        return const MovieHomepage(); // Default to movie_Homepage if not recognized
    }
  }

  Icon getIcon() {
    switch (widget.icon) {
      case "home":
        return const Icon(Icons.home);
      case "search":
        return const Icon(Icons.search);
      case "assistant_navigation":
        return const Icon(Icons.assistant_navigation);
      case "list":
        return const Icon(Icons.list);
      case "supervised_user_circle":
        return const Icon(Icons.supervised_user_circle);
      default:
        return const Icon(Icons.home);
    }
  }
}
