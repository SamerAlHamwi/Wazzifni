

import 'package:flutter/material.dart';

import '../../common/style/padding_insets.dart';
import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';


class CustomRangeSliderWidget extends StatefulWidget {
  const CustomRangeSliderWidget({super.key,
    this.isRequired = false,
    required this.title,
    required this.min,
    required this.max,
  });


  final bool isRequired;
  final String title;
  final double min,max;


  @override
  State<CustomRangeSliderWidget> createState() => _CustomRangeSliderWidgetState();
}

class _CustomRangeSliderWidgetState extends State<CustomRangeSliderWidget> {

  RangeValues _currentRangeValues = const RangeValues(13, 25);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Row(
          children: [
            if(widget.isRequired)
              Padding(
                padding: PaddingInsets.lowPaddingHorizontal,
                child: Text(
                  '*',
                  style: AppText.fontSizeLargeTextStyle.copyWith(
                    color: AppColors.gold,
                  ),
                ),
              ),
            Text(
              widget.title,
              style: AppText.fontSizeMediumTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
