import 'package:flutter/foundation.dart';

class MotionSpringThemeDataPartial {}

class MotionSchemeThemeDataPartial {}

class MotionSchemeThemeData {}

abstract class MotionThemeDataPartial with Diagnosticable {
  MotionSchemeThemeDataPartial get standard;
  MotionSchemeThemeDataPartial get expressive;
}

class MotionThemeData {}
