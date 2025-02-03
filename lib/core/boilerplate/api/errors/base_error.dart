import 'package:easy_localization/easy_localization.dart';

import '../core_models/base_result_model.dart';

class BaseError extends BaseResultModel {
  String? message = 'base_error';

  BaseError({this.message});
}