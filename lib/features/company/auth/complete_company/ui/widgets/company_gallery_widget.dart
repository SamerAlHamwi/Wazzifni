

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/image_widgets/profile_image.dart';

class CompanyGalleryWidget extends StatefulWidget {
  final List<String> imagePaths;
  final Function(List<String>) onChanged;

  const CompanyGalleryWidget({super.key, required this.imagePaths, required this.onChanged});

  @override
  State<CompanyGalleryWidget> createState() => _CompanyGalleryWidgetState();
}

class _CompanyGalleryWidgetState extends State<CompanyGalleryWidget> {

  void _pickImages() async {
    List<PlatformFile> images = await Utils.pickFiles(isMulti: true);
    if (images.isNotEmpty) {
      setState(() {
        widget.imagePaths.addAll(images.map((e) => e.path!));
      });
      widget.onChanged(widget.imagePaths);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: widget.imagePaths.isEmpty
          ? GestureDetector(
            onTap: (){
              _pickImages();
            },
            child: ProfileImageWidget(
                onChanged: (value){},
                isCircle: false,
                isWithSelect: false,
                width: 200,
                height: 150,
              ),
          )
          : ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.imagePaths.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                width: 200,
                height: 150,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: FileImage(File(widget.imagePaths[index])),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.imagePaths.removeAt(index);
                    });
                    widget.onChanged(widget.imagePaths);
                  },
                  child: const Icon(
                    Icons.cancel,
                    color: AppColors.red,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
