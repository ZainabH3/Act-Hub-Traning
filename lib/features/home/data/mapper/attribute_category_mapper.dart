
import 'package:act_hub_training/core/extensions/extensions.dart';

import '../../domain/model/attribute_category_model.dart';
import '../response/attribute_category_response.dart';

extension AttributeCategoryMapper on AttributeCategoryResponse {
  AttributeCategoryModel toDomain() {
    return AttributeCategoryModel(
      title: title.onNull(),
      description: description.onNull(),
      image: image.onNull(),
      type: type.onNull(),
    );
  }
}