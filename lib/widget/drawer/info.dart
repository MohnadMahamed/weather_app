import 'package:flutter/material.dart';
import 'package:weather_app/shared/styles/dimensions.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/me.jpg'),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mohnad Mahamed',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.font20),
            ),
            const SizedBox(
              height: 3,
            ),
            Text('mohnadmahamed@gmail.com',
                style:
                    TextStyle(color: Colors.white, fontSize: Dimensions.font12))
          ],
        )
      ],
    );
  }
}
