import 'package:flutter/material.dart';
import 'package:weather_app/shared/styles/dimensions.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: Dimensions.width30),
      height: 1,
      width: double.infinity,
      color: Colors.grey,
    );
  }
}
