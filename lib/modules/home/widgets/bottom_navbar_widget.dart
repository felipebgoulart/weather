import 'package:flutter/material.dart';
import 'package:weather/core/icons/weather_icons.dart';
import 'package:weather/core/themes/app_colors.dart';
import 'package:weather/modules/home/painters/back_nav_bar_painter.dart';
import 'package:weather/modules/home/painters/front_nav_bar_painter.dart';

class BottomNavBar extends StatelessWidget {
  final Size size;
  final Function() onMorePressed;
  final Function() onLocationPressed;
  final Function() onDetailPressed;

  const BottomNavBar({
    Key? key,
    required this.size,
    required this.onMorePressed,
    required this.onLocationPressed,
    required this.onDetailPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      bottom: 0,
      child: Container(
        color: Colors.transparent,
        height: 100,
        child: Stack(
          children: <Widget> [
            CustomPaint(
              size: size,
              painter: BackNavBarPainter(),
            ),
            CustomPaint(
              size: size,
              painter: FrontNavBarPainter(),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget> [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: <BoxShadow> [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(-10, -10),
                            ),
                            BoxShadow(
                              color: const Color(0xff0D1431).withOpacity(0.5),
                              blurRadius: 20,
                              offset: const Offset(10, 10),
                            ),
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color> [
                              AppColors.white,
                              AppColors.white.withOpacity(.5)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 64,
                        width: 64,
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          child: Container(
                            height: 58,
                            width: 58,
                            decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                              boxShadow: <BoxShadow> [
                                BoxShadow(
                                  color: const Color(0xff0D1431).withOpacity(0.3),
                                  blurRadius: 5,
                                  offset: const Offset(5, 10),
                                )
                              ]
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 42,
                            ),
                          ),
                          onPressed: onMorePressed,
                        ),
                      )
                    ]
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      GestureDetector(
                        onTap: onLocationPressed,
                        child: Icon(
                          AppIcons.location,
                          color: AppColors.white,
                          size: 42,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      GestureDetector(
                        onTap: onDetailPressed,
                        child: Icon(
                          AppIcons.listFav,
                          color: AppColors.white,
                          size: 42,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}