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

  // Universal center cases (uses non-directional Alignment)

  const Align.topCenter({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: Alignment.topCenter);

  const Align.center({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: Alignment.center);

  const Align.bottomCenter({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: Alignment.bottomCenter);

  // Alignment

  const Align.topLeft({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: Alignment.topLeft);

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

  const Align.bottomRight({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: Alignment.bottomRight);

  // AlignmentDirectional

  const Align.topStart({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: AlignmentDirectional.topStart);

  const Align.topEnd({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: AlignmentDirectional.topEnd);

  const Align.centerStart({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: AlignmentDirectional.centerStart);

  const Align.centerEnd({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: AlignmentDirectional.centerEnd);

  const Align.bottomStart({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: AlignmentDirectional.bottomStart);

  const Align.bottomEnd({
    super.key,
    super.widthFactor,
    super.heightFactor,
    super.child,
  }) : super(alignment: AlignmentDirectional.bottomEnd);
}
