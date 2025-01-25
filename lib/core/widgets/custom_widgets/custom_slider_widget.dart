
import 'package:flutter/material.dart';

import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';

class CustomSliderWidget extends StatefulWidget {
  const CustomSliderWidget({
    super.key,
    this.isRequired = false,
    required this.title,
    required this.min,
    required this.max,
  });

  final bool isRequired;
  final String title;
  final double min, max;

  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  double _currentValue = 3;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Row(
          children: [
            if (widget.isRequired)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
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
                child: Slider(
                  value: _currentValue,
                  min: widget.min,
                  max: widget.max,
                  divisions: 20,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.subWhite,
                  label: _currentValue.toStringAsFixed(0),
                  onChanged: (double value) {
                    setState(() {
                      _currentValue = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
