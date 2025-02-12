part of 'icon_button.dart';

class _FilledIconButtonDefaults extends ButtonStyle {
  _FilledIconButtonDefaults({required this.context, required this.selected});

  final BuildContext context;
  final bool? selected;

  late final ThemeData _theme = Theme.of(context);
  ColorScheme get _colors => _theme.colorScheme;

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      WidgetStatePropertyAll(Size(40, 40));

  @override
  WidgetStateProperty<Size?>? get maximumSize =>
      WidgetStatePropertyAll(Size(40, 40));
}
