import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/core/themes/app_colors.dart';
import 'package:weather/core/widgets/cards/item_card_widget.dart';
import 'package:weather/core/widgets/cards/sun_position_card_widget.dart';
import 'package:weather/core/widgets/cards/uv_index_card_widget.dart';
import 'package:weather/src/modules/home/stores/home_store.dart';
import 'package:weather/src/modules/home/widgets/forecast_widget.dart';

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
          _homeStore.closeAnimate();
        }
        return true;
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.01,
        expand: true,
        maxChildSize: 0.9,
        minChildSize: 0.01,
        controller: _homeStore.draggableScrollableController,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
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
                height: MediaQuery.of(context).size.height - 80,
                borderRadius: BorderRadius.circular(50),
                blur: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: <Widget> [
                      Center(
                        child: Container(
                          height: 5,
                          width: MediaQuery.of(context).size.width / 8,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(.7),
                            boxShadow: <BoxShadow> [
                              BoxShadow(
                                color: AppColors.purple,
                                blurRadius: 100,
                                spreadRadius: 50,
                                offset: const Offset(-5, -5)
                              )
                            ]
                          ),
                        ),
                      ),
                      const Forecast(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        child: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) => SizedBox(
                            height: constraints.maxWidth * .55,
                            child: Row(
                              children: <Widget> [
                                Expanded(
                                  child: UvIndexCard(
                                    uvIndex: _homeStore.currentWeather!.uvi,
                                  )
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: SunPositionCard(
                                    date: _homeStore.currentWeather!.date,
                                  )
                                ),
                              ],
                            ),
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