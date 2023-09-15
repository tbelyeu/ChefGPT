import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class PlatformController extends GetxController {
  static PlatformController instance = Get.find();

  var isMobile = (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS)
      .obs;
}
