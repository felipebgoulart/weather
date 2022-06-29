import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/src/modules/home/stores/home_store.dart';
import 'package:weather/src/modules/home/widgets/forecast_widget.dart';
import 'package:weather/src/modules/home/widgets/home_tabs.dart';

class BottomSheetWeather extends StatefulWidget {
  const BottomSheetWeather({ Key? key }) : super(key: key);

  @override
  State<BottomSheetWeather> createState() => _BottomSheetWeatherState();
}

class _BottomSheetWeatherState extends State<BottomSheetWeather> {
  final HomeStore _homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (DraggableScrollableNotification notification) {
        if (notification.extent < .4) {
          if (notification.extent != 0.01) {
            _homeStore.closeAnimate();
          }
        }
        return true;
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.01,
        expand: true,
        maxChildSize: .42,
        minChildSize: 0.01,
        controller: _homeStore.draggableScrollableController,
        builder: (BuildContext context, ScrollController scrollController) {
          _homeStore.scrollController = scrollController;
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            controller: scrollController,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color> [
                    const Color(0xff2E335A).withOpacity(.5),
                    const Color(0xff1C1B33).withOpacity(.5),
                  ],
                ),
              ),
              child: BlurryContainer(
                padding: const EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                height: 340,
                borderRadius: BorderRadius.circular(50),
                blur: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: 
                  Column(
                    children: <Widget> [
                      const HomeTabs(),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Column(
                            children: const <Widget> [
                              Forecast(),
                              SizedBox(
                                height: 80
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}