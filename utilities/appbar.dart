import 'package:flutter/material.dart';
import 'package:my_movie/utilities/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final IconData? icon;

  const CustomAppBar({ Key? key,required this.appBarTitle, this.icon}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,

      //to remove the back button in appbar and align the text to leftmost
      automaticallyImplyLeading: false,

      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              appBarTitle,
              style: textTheme.displayMedium,
            ),
            const Spacer(),
            if (icon != null)
              Icon(
                icon,
                color: Colors.black,
              ),
          ],
        ),

    );
  }
}
