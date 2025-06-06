import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material3_expressive/material3_expressive.dart';

class ComponentThemes extends StatefulWidget {
  const ComponentThemes({super.key, required this.child});

  final Widget child;

  @override
  State<ComponentThemes> createState() => _ComponentThemesState();
}

class _ComponentThemesState extends State<ComponentThemes> {
  late ColorThemeData _colorTheme;
  late ShapeThemeData _shapeTheme;
  late StateThemeData _stateTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _colorTheme = ColorTheme.of(context);
    _shapeTheme = ShapeTheme.of(context);
    _stateTheme = StateTheme.of(context);
  }

  Widget _buildFilledButtonTheme(BuildContext context, Widget child) {
    return FilledButtonTheme(
      data: FilledButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(0.0),
          padding: WidgetStatePropertyAll(
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 10),
          ),
          // shape: WidgetStateProperty.fromMap({
          //   WidgetState.pressed: CornersBorder(
          //     delegate: const RoundedCornersBorderDelegate(),
          //     corners: Corners.all(_shapeTheme.small),
          //   ),
          //   WidgetState.any: CornersBorder(
          //     delegate: const RoundedCornersBorderDelegate(),
          //     corners: Corners.all(_shapeTheme.full),
          //   ),
          // }),
        ),
      ),
      child: child,
    );
  }

  Widget _buildOutlinedButtonTheme(BuildContext context, Widget child) {
    return OutlinedButtonTheme(
      data: OutlinedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(0.0),
          padding: WidgetStatePropertyAll(
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 10),
          ),
          foregroundColor: WidgetStateProperty.fromMap({
            WidgetState.disabled: _colorTheme.onSurface.withValues(alpha: 0.38),
            WidgetState.any: _colorTheme.onSurfaceVariant,
          }),
          iconColor: WidgetStateProperty.fromMap({
            WidgetState.disabled: _colorTheme.onSurface.withValues(alpha: 0.38),
            WidgetState.any: _colorTheme.onSurfaceVariant,
          }),
          backgroundColor: WidgetStateProperty.fromMap({
            WidgetState.disabled: _colorTheme.onSurface.withValues(alpha: 0.12),
            WidgetState.any: Colors.transparent,
          }),
          side: WidgetStateProperty.fromMap({
            WidgetState.any: BorderSide(color: _colorTheme.outlineVariant),
          }),
          // shape: WidgetStateProperty.fromMap({
          //   WidgetState.pressed: CornersBorder(
          //     delegate: const RoundedCornersBorderDelegate(),
          //     corners: Corners.all(_shapeTheme.small),
          //   ),
          //   WidgetState.any: CornersBorder(
          //     delegate: const RoundedCornersBorderDelegate(),
          //     corners: Corners.all(_shapeTheme.full),
          //   ),
          // }),
        ),
      ),
      child: child,
    );
  }

  Widget _buildTextButtonTheme(BuildContext context, Widget child) {
    return TextButtonTheme(
      data: TextButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
      ),
      child: child,
    );
  }

  Widget _buildSliderTheme(BuildContext context, Widget child) {
    return SliderTheme(
      data: SliderThemeData(
        year2023: false,
        overlayColor: Colors.transparent,
        trackHeight: 16.0,
        thumbSize: WidgetStateProperty.fromMap({
          WidgetState.pressed: Size(2.0, 44.0),
          WidgetState.any: Size(4.0, 44.0),
        }),
      ),

      child: child,
    );
  }

  List<Widget Function(BuildContext context, Widget child)> get _builders => [
    _buildFilledButtonTheme,
    _buildOutlinedButtonTheme,
    _buildSliderTheme,
  ];

  @override
  Widget build(BuildContext context) {
    return _builders.reversed.fold(
      widget.child,
      (child, builder) => builder(context, child),
    );
  }
}
