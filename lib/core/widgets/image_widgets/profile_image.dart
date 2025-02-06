

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/utils/utils.dart';
import '../../constants/app_assets.dart';
import '../../constants/appcolors.dart';

class ProfileImageWidget extends StatefulWidget {
  String? imagePath;
  double? width;
  double? height;
  final bool isCircle;
  final bool isWithSelect;

  final Function(String) onChanged;

  ProfileImageWidget({super.key,
    this.imagePath,
    this.width,
    this.height,
    this.isCircle = true,
    this.isWithSelect = true,
    required this.onChanged
  });

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    if (widget.imagePath == null) {
      imageProvider = const AssetImage(AppAssets.cameraIcon);
    } else {
      imageProvider = FileImage(File(widget.imagePath!));
    }

    // else if (Uri.tryParse(widget.imagePath!)?.hasAbsolutePath == true) {
    // imageProvider = NetworkImage(widget.imagePath!);
    // }

    return GestureDetector(
      onTap: widget.isWithSelect ? () async {
        if(widget.imagePath == null){
          List<PlatformFile> image = await Utils.pickFiles();
          if(image.isNotEmpty){
            setState(() {
              widget.imagePath = image.first.path;
            });
            widget.onChanged(widget.imagePath ?? '');
          }
        }
      } : null,
      child: Container(
        width: widget.width ?? 100,
        height: widget.height ?? 100,
        decoration: widget.isCircle ?
        BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          shape: BoxShape.circle,
          boxShadow: AppColors.boxShadow,
          image: DecorationImage(
            image: imageProvider,
            fit: widget.imagePath == null ? null : BoxFit.cover,
          ),
        ) : BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppColors.boxShadow,
          image: DecorationImage(
            image: imageProvider,
            fit: widget.imagePath == null ? null : BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
