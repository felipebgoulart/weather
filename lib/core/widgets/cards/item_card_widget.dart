import 'package:flutter/material.dart';
import 'package:weather/core/themes/app_colors.dart';
import 'package:weather/core/themes/app_typograph.dart';

class ItemCard extends StatelessWidget {
  final Widget? header;
  final Widget body;
  final Widget? footer;

  final IconData? headerIcon;
  final String? headerTitle;

  const ItemCard({
    Key? key,
    required this.body,
    this.header,
    this.footer,
    this.headerIcon,
    this.headerTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.purpleDarker,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          width: 2,
          color: AppColors.purple
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            header 
            ?? Row(
              children: <Widget> [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Icon(
                    headerIcon ?? Icons.sunny,
                    color: AppColors.white.withOpacity(.5),
                  ),
                ),
                Text(
                  headerTitle ?? 'Default text',
                  style: weatherCardTitle,
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: body,
              ),
            ),
            footer ?? Container()
          ],
        ),
      ),
    );
  }
}