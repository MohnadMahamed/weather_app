import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //height : 765.0
  //width : 360.0
//844
//   static double pageView = screenHeight / 2.64; //320
//   static double pageViewContainer = screenHeight / 3.84;
//   static double pageViewTextContainer = screenHeight / 7.03;
// //844
  static double pageView = screenHeight / 2.39; //320
  static double pageViewContainer = screenHeight / 3.48; //220
  static double pageViewTextContainer = screenHeight / 6.38; //120

  //dynamic height padding and margin
  static double height10 = screenHeight / 76.5;
  static double height15 = screenHeight / 51.0;
  static double height20 = screenHeight / 38.25;
  static double height30 = screenHeight / 25.5;
  static double height45 = screenHeight / 17.0;

  // //dynamic height padding and margin
  // static double height10 = screenHeight / 84.4;
  // static double height15 = screenHeight / 56.27;
  // static double height20 = screenHeight / 42.2;
  // static double height30 = screenHeight / 28.13;
  // static double height45 = screenHeight / 18.76;

  //dynamic height padding and margin
  static double width10 = screenWidth / 36;
  static double width15 = screenWidth / 24;
  static double width20 = screenWidth / 18;
  static double width30 = screenWidth / 12;

  // //dynamic height padding and margin
  // static double width10 = screenHeight / 84.4;
  // static double width15 = screenHeight / 56.27;
  // static double width20 = screenHeight / 42.2;
  // static double width30 = screenHeight / 28.13;

  //font size
  static double font12 = screenWidth / 30;
  static double font10 = screenWidth / 36;
  static double font16 = screenWidth / 22.5;
  static double font20 = screenWidth / 18;
  static double font26 = screenWidth / 13.85;
  static double font30 = screenWidth / 12;

  // //font size
  // static double font12 = screenHeight / 70.3;
  // static double font10 = screenHeight / 84.4;
  // static double font16 = screenHeight / 52.75;
  // static double font20 = screenHeight / 42.2;
  // static double font26 = screenHeight / 32.46;
  // static double font30 = screenHeight / 28.13;

  //radius
  static double radius15 = screenWidth / 24;
  static double radius20 = screenWidth / 18;
  static double radius30 = screenWidth / 12;

  // //radius
  // static double radius15 = screenHeight / 56.27;
  // static double radius20 = screenHeight / 42.2;
  // static double radius30 = screenHeight / 28.13;

  //icon size
  static double iconSize24 = screenWidth / 15;
  static double iconSize16 = screenWidth / 22.5;

  // //icon size
  // static double iconSize24 = screenHeight / 35.17;
  // static double iconSize16 = screenHeight / 52.75;

  //slivser appBar
  static double toolbarHeight = screenHeight / 4.5; //170
  static double expandedHeight = screenHeight / 2.55; //300
  static double scrollHeight = screenHeight / 15.3; //50

  //slivser appBar
  // static double toolbarHeight = screenHeight / 4.22; //200
  // static double expandedHeight = screenHeight / 2.81; //300
  // static double scrollHeight = screenHeight / 16.88; //50
}
