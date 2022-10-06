import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:weather_app/shared/styles/dimensions.dart';

class BottomNavBar extends StatelessWidget {
  final double currPageValue;

  const BottomNavBar({Key? key, required this.currPageValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var currPageValue = 0.0;

    return Container(
      // width: size.width,
      // height: size.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.radius20),
              topLeft: Radius.circular(Dimensions.radius20)),
          image: DecorationImage(
            image: const AssetImage('assets/light.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black26.withOpacity(0.4),
              BlendMode.darken,
            ), // ColorFilter.mode
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MyHomePageState(),
                //   ),
                // );
              },
              icon: const Icon(
                Icons.abc,
                size: 30.0,
                color: Colors.white,
              )),
          // DotsIndicator(
          //     dotsCount: 5,
          //     position: currPageValue,
          //     decorator: DotsDecorator(
          //         activeColor: Colors.lightBlue,
          //         size: const Size.square(9.0),
          //         activeSize: const Size(18.0, 9.0),
          //         activeShape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(5.0)))),
          IconButton(
            onPressed: () {
              ZoomDrawer.of(context)!.toggle();
            },
            icon: const Icon(
              Icons.menu_open,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
