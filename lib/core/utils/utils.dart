


import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wazzifni/core/constants/appcolors.dart';

class Utils{

  static void showToast(
      String message,
      ) async {
    await Fluttertoast.showToast(
        textColor: AppColors.white,
        backgroundColor: AppColors.primaryColor,
        fontSize: 14,
        toastLength: Toast.LENGTH_LONG,
        msg: message,
        gravity: ToastGravity.CENTER
    );
  }

  static Future<List<File>> pickFiles({bool isMulti = false,bool isImages = true}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: isMulti,
        type: FileType.custom,
        allowedExtensions: isImages ? ['jpg', 'jpeg', 'png','webp',] : ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      return [];
    }
  }
}