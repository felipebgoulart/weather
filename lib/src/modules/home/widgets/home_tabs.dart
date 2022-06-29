import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/core/themes/app_colors.dart';
import 'package:weather/core/themes/app_typograph.dart';
import 'package:weather/src/modules/home/stores/home_store.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({Key? key}) : super(key: key);

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  final HomeStore _homeStore = Modular.get<HomeStore>();

  Widget _tab(String title, {required int index}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _homeStore.changeTab(index);
          _homeStore.buildForecastItem();
        },
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
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        children: <Widget>[
          _tab('Hourly Forecast', index: 0),
          const SizedBox(width: 16),
          _tab('Weekly Forecast', index: 1)
        ],
      ),
    );
  }
}