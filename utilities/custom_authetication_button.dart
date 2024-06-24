import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomAutheticationButton extends StatelessWidget {
  final Color? colour;
  final Color? textcolour;
  final String image;
  final String text;


  const CustomAutheticationButton({
    Key? key,
    this.colour,
    required this.image,
    required this.text,
    this.textcolour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35.0, right: 35.0),
      padding: const EdgeInsets.only(top: 5.0, left: 7.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: colour,
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage(image),
            width: 40.0,
            height: 40.0,
          ),
          const SizedBox(width: 49),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Gabarito',
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: textcolour,
            ),
          ),
        ],
      ),
    );
  }
}
