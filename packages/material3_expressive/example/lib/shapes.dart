import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:path_parsing/path_parsing.dart';

// abstract final class Shapes {
//   DynamicPath get arch =>
//       DynamicPath(size: const Size(380.0, 380.0), nodes: nodes);
// }

class _PathProxy implements PathProxy {
  _PathProxy() : _nodes = [];

  final List<DynamicNode> _nodes;

  DynamicPath toDynamicPath(Size size) =>
      DynamicPath(size: size, nodes: List.of(_nodes));

  @override
  void moveTo(double x, double y) {
    debugPrint("moveTo($x, $y)");
  }

  @override
  void lineTo(double x, double y) {
    debugPrint("lineTo($x, $y)");
  }

  @override
  void cubicTo(
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
  ) {
    debugPrint("cubicTo($x1, $y1, $x2, $y2, $x3, $y3)");
  }

  @override
  void close() {
    debugPrint("close()");
  }
}

class _PathCommands implements PathProxy {
  _PathCommands();

  final List<Command> _commands = [];
  List<Command> get commands => List.of(_commands);

  @override
  void moveTo(double x, double y) {
    _commands.add(MoveCommand(x, y));
  }

  @override
  void lineTo(double x, double y) {
    _commands.add(LineCommand(x, y));
  }

  @override
  void cubicTo(
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
  ) {
    _commands.add(CurveCommand(x1, y1, x2, y2, x3, y3));
  }

  @override
  void close() {
    _commands.add(const CloseCommand());
  }
}

List<Command> parseCommands(String svgPathData) {
  final proxy = _PathCommands();
  writeSvgPathDataToPath(svgPathData, proxy);
  return proxy._commands;
}

sealed class Command {
  const Command();
}

class MoveCommand extends Command {
  const MoveCommand(this.x, this.y);

  final double x;
  final double y;
}

class LineCommand extends Command {
  const LineCommand(this.x, this.y);

  final double x;
  final double y;
}

class CurveCommand extends Command {
  const CurveCommand(this.x1, this.y1, this.x2, this.y2, this.x3, this.y3);

  final double x1;
  final double y1;
  final double x2;
  final double y2;
  final double x3;
  final double y3;
}

class CloseCommand extends Command {
  const CloseCommand();
}

DynamicPath parseDynamicPath({required String source, required Size size}) {
  final commands = parseCommands(source);
  debugPrint("$source");
  final List<DynamicNode> nodes = <DynamicNode>[];

  Offset currentPosition = Offset.zero;
  Offset? currentPreviousControl;
  Offset? currentNextControl;

  Offset? nextPosition;
  Offset? nextPreviousControl;
  Offset? nextNextControl;

  for (final command in commands) {
    switch (command) {
      case MoveCommand(:final x, :final y):
        debugPrint("M $x $y");
        currentPosition = Offset(x, y);
      case LineCommand(:final x, :final y):
        debugPrint("L $x $y");
      case CurveCommand(
        :final x1,
        :final y1,
        :final x2,
        :final y2,
        :final x3,
        :final y3,
      ):
        debugPrint("C $x1 $y1 $x2 $y2 $x3 $y3");
        currentNextControl = Offset(x1, y1);
        nextPosition = Offset(x3, y3);
        nextPreviousControl = Offset(x2, y2);
      case CloseCommand():
        debugPrint("Z");
    }
    nodes.add(
      DynamicNode(
        position: currentPosition,
        prev: currentPreviousControl,
        next: currentNextControl,
      ),
    );
    currentPreviousControl = null;
    currentNextControl = null;
  }
  return DynamicPath(size: size, nodes: nodes);
}
