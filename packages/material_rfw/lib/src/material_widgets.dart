import 'package:material/material.dart';
import 'package:rfw/rfw.dart';

LocalWidgetLibrary createMaterialWidgets() =>
    LocalWidgetLibrary(_materialWidgetsDefinitions);

Map<String, LocalWidgetBuilder> get _materialWidgetsDefinitions =>
    <String, LocalWidgetBuilder>{
      "Button":
          (context, source) => Button(
            variant:
                ArgumentDecoders.enumValue(ButtonVariant.values, source, [
                  "variant",
                ]) ??
                ButtonVariant.filled,
            onPressed: source.voidHandler(["onPressed"]),
            onLongPress: source.voidHandler(["onLongPress"]),
            autofocus: source.v<bool>(["autofocus"]) ?? false,
            icon: source.optionalChild(["icon"]),
            label: source.optionalChild(["label"]),
            tooltip: source.v<String>(["tooltip"]),
          ),
      "IconButton":
          (context, source) => IconButton(
            variant:
                ArgumentDecoders.enumValue(IconButtonVariant.values, source, [
                  "variant",
                ]) ??
                IconButtonVariant.standard,
            onPressed: source.voidHandler(["onPressed"]),
            onLongPress: source.voidHandler(["onLongPress"]),
            autofocus: source.v<bool>(["autofocus"]) ?? false,
            icon: source.child(["icon"]),
            tooltip: source.v<String>(["tooltip"]),
          ),
      "FloatingActionButton":
          (context, source) => FloatingActionButton(
            variant:
                ArgumentDecoders.enumValue(
                  FloatingActionButtonVariant.values,
                  source,
                  ["variant"],
                ) ??
                FloatingActionButtonVariant.primary,
            size:
                ArgumentDecoders.enumValue(
                  FloatingActionButtonSize.values,
                  source,
                  ["size"],
                ) ??
                FloatingActionButtonSize.regular,
            lowered: source.v<bool>(["lowered"]) ?? false,
            onPressed: source.voidHandler(["onPressed"]),
            autofocus: source.v<bool>(["autofocus"]) ?? false,
            icon: source.child(["icon"]),
            tooltip: source.v<String>(["tooltip"]),
          ),
    };
