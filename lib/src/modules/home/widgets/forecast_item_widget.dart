import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/core/themes/app_colors.dart';
import 'package:weather/src/modules/home/models/forecast_item_model.dart';
import 'package:weather/src/modules/home/stores/home_store.dart';
import 'package:weather/src/modules/home/stores/home_store_interface.dart';

class ForecastItem extends StatefulWidget {
  final ForecastItemModel forecastItem;
  final int index;
  final Function update;

  const ForecastItem({
    Key? key,
    required this.index,
    required this.forecastItem,
    required this.update
  }) : super(key: key);

  @override
  State<ForecastItem> createState() => _ForecastItemState();
}

class _ForecastItemState extends State<ForecastItem> {
  final IHomeStore _homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.update();
        _homeStore.draggableScrollableController.reset();
        _homeStore.isOpen = false;
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
            color: _homeStore.selectedTab == 0 ? _homeStore.weather!.hourly[widget.index].selected ? AppColors.purple : Colors.transparent : _homeStore.weather!.daily[widget.index].selected ? AppColors.purple : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const <BoxShadow> [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black26,
                offset: Offset(6, 2)
              )
            ]
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: AppColors.purple
              ),
            ),
            child: BlurryContainer(
              borderRadius: BorderRadius.circular(50),
              height: double.infinity,
              width: 70,
              bgColor: AppColors.primaryDarker.withOpacity(0.1),
              blur: 1,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                children: <Widget> [
                  Text(
                    widget.forecastItem.title,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Image.asset(widget.forecastItem.iconPath),
                        Text(
                          widget.forecastItem.humidity,
                          style: TextStyle(
                            color: AppColors.lightBlue,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    widget.forecastItem.temp,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.white
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}