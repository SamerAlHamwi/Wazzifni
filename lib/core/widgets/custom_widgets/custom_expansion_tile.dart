import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';

import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile(
      {super.key,
        required this.items,
        required this.title,
        this.isExpanded = false
      });

  final List<String> items;
  final String title;
  final bool isExpanded;


  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
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
              textColor: AppColors.black,
              collapsedTextColor: AppColors.black,
              iconColor: AppColors.black,
              collapsedIconColor: AppColors.black,
              childrenPadding: PaddingInsets.normalPaddingHorizontal,
              title: Text(
                widget.title,
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: List.generate(
                widget.items.length,
                (index) => RadioListTile<String>(
                  title: Text(
                    widget.items[index],
                    style: AppText.fontSizeNormalTextStyle,
                  ),
                  value: widget.items[index],
                  groupValue: selectedOption,
                  activeColor: AppColors.primaryColor,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              )),
        ),
        const Divider(thickness: 1.5,),
      ],
    );
  }
}
