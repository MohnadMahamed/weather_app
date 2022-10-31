import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/shared/styles/dimensions.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;
  const SmallText(
      {Key? key,
      this.color = Colors.white,
      required this.text,
      this.size = 0,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.fade,
      style: GoogleFonts.cairo(
        // overflow: TextOverflow.ellipsis,
        height: height,
        color: color,
        fontWeight: FontWeight.w800,
        fontSize: size == 0 ? Dimensions.font16 : size,
      ),
    );
  }
}
