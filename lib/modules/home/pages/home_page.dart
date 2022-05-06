import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/core/constants/assets_global.dart';
import 'package:weather/modules/home/widgets/bottom_navbar_widget.dart';
import 'package:weather/modules/home/widgets/bottom_sheet_weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff3A3F54),
        image: DecorationImage(
          image: AssetImage(AppAssets.nightSky),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.only(bottom: 85),
              child: Column(
                children: <Widget> [
                  Expanded(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget> [
                          Text(
                            'Montreal',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          Text(
                            '19°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 96,
                              fontWeight: FontWeight.w100
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Image.asset(
                      AppAssets.house,
                      width: MediaQuery.of(context).size.width,
                    ),
                  )
                ],
              ),
            ),
            const BottomSheetWeather(),
            BottomNavBar(
              size: size,
              onMorePressed: () {
                debugPrint('more pressed');
              },
              onLocationPressed: () {
                debugPrint('location pressed');
              },
              onDetailPressed: () {
                debugPrint('detail pressed');
              },
            ),
          ],
        ),
      )
    );
  }
}