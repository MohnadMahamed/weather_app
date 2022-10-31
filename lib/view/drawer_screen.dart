import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/home_controllers.dart';
import 'package:weather_app/shared/styles/colors.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:weather_app/widget/drawer/info.dart';
import 'package:weather_app/widget/drawer/other_locations.dart';
import 'package:weather_app/widget/drawer/your_location.dart';
import 'package:weather_app/widget/my_divider.dart';
import 'package:weather_app/widget/small_text.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerScreen extends StatefulWidget {
  final ValueSetter setIndex;
  const DrawerScreen({Key? key, required this.setIndex}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: drawerColor,
        body: Padding(
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                left: Dimensions.width10,
                right: Dimensions.width10),
            child: GetBuilder<HomeController>(
                builder: (drawerController) => drawerController.isloaded
                    ? Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //info section
                          const InfoWidget(),
                          SizedBox(
                            height: Dimensions.height30,
                          ),
                          Expanded(
                            flex: 5,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: Dimensions.height30,
                                  ),
                                  // location section
                                  const YourLocation(),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  const MyDivider(),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  //Other Locations
                                  const OtherLocations(),
                                  const MyDivider(),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          launchUrl(
                                            Uri(
                                              scheme: 'mailto',
                                              path:
                                                  'mohnadmahamed7777@gmail.com',
                                              // query: (<String, String>{
                                              //   'subject': 'Example Subject & Symbols are allowed!',
                                              // }
                                            ),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.info_outline,
                                              color: Colors.white,
                                              size: Dimensions.iconSize24,
                                            ),
                                            SizedBox(
                                              width: Dimensions.width10,
                                            ),
                                            const SmallText(
                                              text: 'Report wrong Location',
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: Dimensions.height20,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          launchUrl(
                                            Uri(
                                              scheme: 'mailto',
                                              path:
                                                  'mohnadmahamed7777@gmail.com',
                                              // query: (<String, String>{
                                              //   'subject': 'Example Subject & Symbols are allowed!',
                                              // }
                                            ),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.mail_outline_rounded,
                                              color: Colors.white,
                                              size: Dimensions.iconSize24,
                                            ),
                                            SizedBox(
                                              width: Dimensions.width10,
                                            ),
                                            const SmallText(
                                              text: 'Contact us',
                                              // size: Dimensions.font20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: Dimensions.height20,
                                  ),
                                  // drawerList(Icons.home, "Home", 0),
                                  // drawerList(Icons.mail, "Inbox", 1),
                                  // drawerList(Icons.send, "Sent", 2),
                                  // drawerList(Icons.favorite, "Favorite", 3),
                                  // drawerList(Icons.archive, "Archive", 4),
                                  // drawerList(Icons.block, "Spam", 5),
                                  const SizedBox(
                                    height: 50,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      ))),
      ),
    );
  }

  Widget drawerList(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        widget.setIndex(index);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, bottom: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
