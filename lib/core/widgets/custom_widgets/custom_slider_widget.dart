

import 'package:flutter/material.dart';

import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';


class CustomSliderWidget extends StatefulWidget {
  const CustomSliderWidget({super.key});

  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  RangeValues _currentRangeValues = const RangeValues(13, 25);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          "الراتب المتوقع",
          style: AppText.fontSizeMediumTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.expand_less, color: Colors.black),
        maintainState: true,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RangeSlider(
                  values: _currentRangeValues,
                  min: 10,
                  max: 40,
                  divisions: 20,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.subWhite,
                  labels: RangeLabels(
                    '\$${_currentRangeValues.start.toStringAsFixed(0)}k',
                    '\$${_currentRangeValues.end.toStringAsFixed(0)}k',
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${_currentRangeValues.start.toStringAsFixed(0)}k',
                      style: AppText.fontSizeNormalTextStyle,
                    ),
                    Text(
                        '\$${_currentRangeValues.end.toStringAsFixed(0)}k',
                        style: AppText.fontSizeNormalTextStyle
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
