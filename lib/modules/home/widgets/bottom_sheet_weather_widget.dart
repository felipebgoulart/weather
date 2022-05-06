import 'package:flutter/material.dart';
import 'package:weather/core/themes/app_colors.dart';

class BottomSheetWeather extends StatefulWidget {
  const BottomSheetWeather({ Key? key }) : super(key: key);

  @override
  State<BottomSheetWeather> createState() => _BottomSheetWeatherState();
}

class _BottomSheetWeatherState extends State<BottomSheetWeather> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.30,
      maxChildSize: 1,
      minChildSize: 0.15,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color> [
                Color(0xff2E335A).withOpacity(.7),
                Color(0xff1C1B33).withOpacity(.7)
              ],
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    // height: 100,
                    child: Text('data'),
                  ),
                  Container(
                    color: Colors.red,
                    child: Text('adds')
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}