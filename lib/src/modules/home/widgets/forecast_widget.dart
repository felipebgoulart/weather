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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 1,
          decoration: BoxDecoration(
            color: AppColors.primaryDarker.withOpacity(.5),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black, blurRadius: 5, offset: Offset(0, 2)
              )
            ]
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: 170,
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
