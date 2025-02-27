import 'package:flutter/widgets.dart';

/// A builder that builds a widget given a child.
///
/// The child should typically be part of the returned widget tree.
///
/// Used by [CombiningBuilder.builders].
typedef WidgetBuilderWithChild =
    Widget Function(BuildContext context, Widget child);

/// A stateless utility widget whose [build] method uses its
/// [builders] callbacks to create the widget's child.
///
/// It was designed for nesting multiple build callbacks of type [WidgetBuilderWithChild].
///
/// Useful for applying theme builders, each requiring a build context, as in:
/// ```dart
/// // Before
/// final Widget child = /* ... */;
/// return _buildElevatedButtonTheme(
///   context, _buildFilledButtonTheme(
///     context, _buildFilledTonalButtonTheme(
///       context, _buildOutlinedButtonTheme(
///         context, _buildTextButtonTheme(
///           context, child
///         )
///       )
///     )
///   )
/// );
/// ```
///
/// ```dart
/// // After
/// final child = /* ... */;
/// return Widget CombiningBuilder(
///   builders: [
///     _buildElevatedButtonTheme,
///     _buildFilledButtonTheme,
///     _buildFilledTonalButtonTheme,
///     _buildOutlinedButtonTheme,
///     _buildTextButtonTheme,
///   ],
///   child: child,
/// );
/// ```
class CombiningBuilder extends StatelessWidget {
  /// Creates a widget that delegates its build to multiple callbacks.
  const CombiningBuilder({
    super.key,
    this.builders = const [],
    required this.child,
  });

  // TODO: investigate and add info about calling order
  /// List of builder functions which are called to obtain the child widget.
  ///
  /// These functions are called whenever this widget is included in its parent's
  /// build and the old widget (if any) that it synchronizes with has a distinct
  /// object identity. Typically the parent's build method will construct
  /// a new tree of widgets and so a new [CombiningBuilder] child will
  /// not be [identical] to the corresponding old one.
  final List<WidgetBuilderWithChild> builders;

  /// The child widget to pass to the first function of [builders].
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Reversed so that the first element is the outermost in the resulting tree
    return builders.reversed.fold<Widget>(
      child,
      (child, builder) => builder(context, child),
    );
  }
}
