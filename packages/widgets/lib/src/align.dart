import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart' as flutter_widgets;

class Align extends flutter_widgets.Align {
  const Align({
    super.key,
    required super.alignment,
    super.widthFactor,
    super.heightFactor,
    super.child,
  });

  // Alignment

  const Align.topLeft({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: Alignment.topLeft);
  const Align.topCenter({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: Alignment.topCenter);
  const Align.topRight({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: Alignment.topRight);
  const Align.centerLeft({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: Alignment.centerLeft);
  const Align.center({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: Alignment.center);
  const Align.centerRight({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: Alignment.centerRight);
  const Align.bottomLeft({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: Alignment.bottomLeft);
  const Align.bottomCenter({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: Alignment.bottomCenter);
  const Align.bottomRight({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: Alignment.bottomRight);

  // // AlignmentDirectional

  // const Align.topLeft({
  //   super.key,
  //   super.widthFactor,
  //   super.heightFactor,
  //   super.child,
  // }) : super(alignment: AlignmentDirectional.topLeft);
  // const Align.topCenter({
  //   super.key,
  //   super.widthFactor,
  //   super.heightFactor,
  //   super.child,
  // }) : super(alignment: AlignmentDirectional.topCenter);
  // const Align.topRight({
  //   super.key,
  //   super.widthFactor,
  //   super.heightFactor,
  //   super.child,
  // }) : super(alignment: AlignmentDirectional.topRight);
  // const Align.centerLeft({
  //   super.key,
  //   super.widthFactor,
  //   super.heightFactor,
  //   super.child,
  // }) : super(alignment: AlignmentDirectional.centerLeft);
  // const Align.center({
  //   super.key,
  //   super.widthFactor,
  //   super.heightFactor,
  //   super.child,
  // }) : super(alignment: AlignmentDirectional.center);
  // const Align.centerRight({
  //   super.key,
  //   super.widthFactor,
  //   super.heightFactor,
  //   super.child,
  // }) : super(alignment: AlignmentDirectional.centerRight);
  // const Align.bottomLeft({
  //   super.key,
  //   super.widthFactor,
  //   super.heightFactor,
  //   super.child,
  // }) : super(alignment: AlignmentDirectional.bottomLeft);
  // const Align.bottomCenter({
  //   super.key,
  //   super.widthFactor,
  //   super.heightFactor,
  //   super.child,
  // }) : super(alignment: AlignmentDirectional.bottomCenter);
  // const Align.bottomEnd({
  //   super.key,
  //   super.widthFactor,
  //   super.heightFactor,
  //   super.child,
  // }) : super(alignment: AlignmentDirectional.bottomEnd);
}
