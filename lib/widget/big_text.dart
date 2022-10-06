import 'package:flutter/material.dart';
import 'package:weather_app/shared/styles/dimensions.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final TextOverflow overflow;
  const BigText(
      {Key? key,
      this.color = Colors.white,
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontFamily: 'jannah',
        overflow: overflow,
        color: color,
        fontSize: size == 0 ? Dimensions.font30 : size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
