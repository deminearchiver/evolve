# Floating action button (FAB)

## Status

## Usage


#### Required imports

```dart
import 'package:material/material.dart';
```

### Using the component

```dart
FloatingActionButton(
  onPressed: () {},
  icon: const Icon(Symbols.add),
)
```


## API

| Property | Type | Default | Description |
| - | - | - | - |
| `variant` | [`FloatingActionButtonVariant`]() | [`FloatingActionButtonVariant.primary`]() | The FAB color variant to render. |
| `size` | [`FloatingActionButtonSize`]() | [`FloatingActionButtonSize.regular`]() | 	The size of the FAB. |
| `onPressed` | [`VoidCallback?`](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) | | 	The size of the FAB. |
| `icon` | [`Widget`](https://api.flutter.dev/flutter/widgets/Widget-class.html) | | 	The size of the FAB. |
| `tooltip` | [`String`](https://api.flutter.dev/flutter/dart-core/String-class.html) | `null` | Text that describes the action that will occur when the button is pressed or hovered over. This text is displayed when the user long-presses or hovers over the button in a tooltip. This string is also used for accessibility. If null, the button will not display a tooltip. |

