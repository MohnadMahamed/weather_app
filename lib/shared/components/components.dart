import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultTextFormFeild({
  required TextEditingController? controller,
  IconData? suffix,
  required String? hintText,
  TextInputType? type,
  void Function(String)? onTap,
  void Function(String)? onChanged,
}) =>
    Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: SizedBox(
        height: Dimensions.height30 * 2,
        width: Dimensions.width30 * 13,
        child: TextField(
          style: TextStyle(fontSize: Dimensions.font26, color: Colors.white),
          controller: controller,
          keyboardType: type,
          onChanged: onChanged,
          onSubmitted: onTap,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent.withOpacity(.5),
            hintText: '$hintText',
            suffixIcon: Icon(suffix, color: Colors.white),
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.font20,
            ),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide:
                  const BorderSide(width: 0.0, color: Colors.transparent),
            ),
          ),
        ),
      ),
    );
// Widget defaultButton({
//   // required TextEditingController? controller,
//   IconData? suffix,
//   required String? text,
//   void Function()? onTap,
// }) =>
//     InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//         child: SizedBox(
//           height: Dimensions.height30 * 2,
//           width: Dimensions.width30 * 13,
//           child: Container(
//             // style: TextStyle(fontSize: Dimensions.font26, color: Colors.white),
//             // controller: controller,
//             // keyboardType: type,
//             // onTap: onTap,
//             decoration: BoxDecoration(
//               // filled: true,
//               color: Colors.transparent.withOpacity(.5),
//               // hintText: '$hintText',
//               // suffixIcon: Icon(suffix, color: Colors.white),
//               // border: const OutlineInputBorder(),
//               borderRadius: BorderRadius.circular(50.0),
//               // borderSide:
//               //     const BorderSide(width: 0.0, color: Colors.transparent),

//               // enabledBorder: OutlineInputBorder(
//               //   borderRadius: BorderRadius.circular(50.0),
//               //   borderSide:
//               //       const BorderSide(width: 0.0, color: Colors.transparent),
//               // ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   '$text',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: Dimensions.font20,
//                   ),
//                 ),
//                 Icon(suffix, color: Colors.white)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );

double long = 31.2569488;
double lat = 30.7418472;

changeLocation() async {
  bool servicestatus = await Geolocator.isLocationServiceEnabled();

  if (servicestatus) {
    log("GPS service is enabled");
  } else {
    log("GPS service is disabled.");
  }

  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      log('Location permissions are denied');
    } else if (permission == LocationPermission.deniedForever) {
      log("'Location permissions are permanently denied");
    } else {
      log("GPS Location service is granted");
    }
  } else {
    log("GPS Location permission granted.");
  }
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  log(position.longitude.toString()); //Output: 80.24599079
  log(position.latitude.toString()); //Output: 29.6593457
  long = position.longitude;
  lat = position.latitude;
}

void showToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER_LEFT,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 15.0,
    );

enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.teal;
      break;
  }
  return color;
}

Widget myIndicator() => Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Dimensions.height45),
        child:
            const CircularProgressIndicator(strokeWidth: 5, color: Colors.blue),
      ),
    );
