import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/core/themes/app_colors.dart';
import 'package:weather/core/themes/app_typograph.dart';
import 'package:weather/src/modules/home/models/forecast_item_model.dart';
import 'package:weather/src/modules/home/stores/home_store.dart';
import 'package:weather/src/modules/home/stores/home_store_interface.dart';
import 'package:weather/src/modules/home/widgets/forecast_item_widget.dart';

class Forecast extends StatefulWidget {
  const Forecast({Key? key}) : super(key: key);

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  final IHomeStore _homeStore = Modular.get<HomeStore>();

  Widget _tab(String title, {required int index}) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _homeStore.changeTab(index),
        child: Observer(
          builder: (BuildContext context) => Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  title,
                  style: segmentTitle,
                ),
              ),
              _homeStore.selectedTab == index
                  ? Container(
                      height: 1,
                      decoration: BoxDecoration(
                          color: AppColors.transparent,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: AppColors.white,
                                blurRadius: 3,
                                offset: const Offset(0, -1))
                          ]),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Row(
            children: <Widget>[
              _tab('Hourly Forecast', index: 0),
              const SizedBox(width: 16),
              _tab('Weekly Forecast', index: 1)
            ],
          ),
        ),
        Container(
          height: 1,
          decoration: BoxDecoration(
              color: AppColors.primaryDarker.withOpacity(.5),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Colors.black, blurRadius: 5, offset: Offset(0, 2))
              ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: 160,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Observer(
                    builder: (BuildContext context) => ListView.builder(
                      controller: _homeStore.forecastHorizontalScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: _homeStore.forecastListLenght(),
                      itemBuilder: (BuildContext context, int index) {
                        ForecastItemModel forecastItem = _homeStore.buildForecastItem(index);

                        return Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: ForecastItem(
                            key: UniqueKey(),
                            forecastItem: forecastItem,
                          ),
                        );
                      },
                    )
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
