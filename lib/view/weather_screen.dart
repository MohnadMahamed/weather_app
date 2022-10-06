import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:weather_app/widget/weather/bottom_nav_bar.dart';
import 'package:weather_app/widget/weather/sliver_adaptor/sliver_adapter.dart';
import 'package:weather_app/widget/weather/sliver_appbar/sliver_background.dart';
import 'package:weather_app/widget/weather/sliver_appbar/sliver_title.dart';

class WeatherHomeScreen extends StatefulWidget {
  final String title;

  const WeatherHomeScreen({Key? key, this.title = "Home"}) : super(key: key);

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  late ScrollController scrollController;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool showTitle = false;
  var currPageValue = 0.0;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      log(scrollController.position.pixels.toString());
      if (scrollController.position.pixels >= Dimensions.scrollHeight) {
        setState(() {
          showTitle = true;
        });
      } else {
        setState(() {
          showTitle = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _key,
          backgroundColor: Colors.grey[400],
          body: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: Dimensions.toolbarHeight,
                pinned: true,
                backgroundColor: Colors.transparent,
                expandedHeight: Dimensions.expandedHeight,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: showTitle == true
                      ? const SliverTitle()
                      : const SizedBox(
                          height: 0.0,
                        ),
                  background: showTitle == false
                      ? const SliverBackground()
                      : const SizedBox(
                          height: 0.0,
                        ),
                ),
              ),
              const SliverAdapter(),
            ],
          ),
          bottomNavigationBar: BottomNavBar(
            currPageValue: currPageValue,
          )),
    );
  }
}
