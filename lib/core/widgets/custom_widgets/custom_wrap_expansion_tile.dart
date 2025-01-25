

import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';

import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';

class CustomWrapExpansionTile extends StatefulWidget {
  const CustomWrapExpansionTile(
      {super.key,
        required this.items,
        required this.title,
        this.isRequired = false,
        this.isExpanded = false,
      });

  final List<String> items;
  final String title;
  final bool isRequired;
  final bool isExpanded;

  @override
  State<CustomWrapExpansionTile> createState() => _CustomWrapExpansionTileState();
}

class _CustomWrapExpansionTileState extends State<CustomWrapExpansionTile> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              initiallyExpanded: widget.isExpanded,
              maintainState: true,
              textColor: AppColors.black,
              collapsedTextColor: AppColors.black,
              iconColor: AppColors.black,
              collapsedIconColor: AppColors.black,
              childrenPadding: PaddingInsets.normalPaddingHorizontal,
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
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: widget.items.map((option) {
                    bool isSelected = selectedOption == option;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOption = option;
                        });
                      },
                      child: Container(
                        padding: PaddingInsets.cardPaddingHV,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryColor : AppColors.subWhite,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          option,
                          style: AppText.fontSizeNormalTextStyle.copyWith(
                            color: isSelected ? AppColors.white : AppColors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
          ),
        ),
        const Divider(thickness: 1.5,),
      ],
    );
  }
}

