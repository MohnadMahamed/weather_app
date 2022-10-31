import 'package:flutter/material.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:weather_app/widget/big_text.dart';
import 'package:weather_app/widget/small_text.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/me.jpg'),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(text: 'Mohnad Mahamed', size: Dimensions.font16),
            const SizedBox(
              height: 5,
            ),
            SmallText(text: 'mohnad7@gmail.com', size: Dimensions.font12)
          ],
        )
      ],
    );
  }
}
