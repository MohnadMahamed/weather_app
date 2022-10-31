import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.kanit(
        color: color,
        fontSize: size == 0 ? Dimensions.font26 : size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
