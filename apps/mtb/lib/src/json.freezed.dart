// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Figma {

 String get description;@ColorConverter() Color get seed; FigmaCoreColors get coreColors; List<FigmaExtendedColor> get extendedColors; FigmaSchemes get schemes; FigmaPalettes get palettes;
/// Create a copy of Figma
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FigmaCopyWith<Figma> get copyWith => _$FigmaCopyWithImpl<Figma>(this as Figma, _$identity);

  /// Serializes this Figma to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Figma&&(identical(other.description, description) || other.description == description)&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.coreColors, coreColors) || other.coreColors == coreColors)&&const DeepCollectionEquality().equals(other.extendedColors, extendedColors)&&(identical(other.schemes, schemes) || other.schemes == schemes)&&(identical(other.palettes, palettes) || other.palettes == palettes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description,seed,coreColors,const DeepCollectionEquality().hash(extendedColors),schemes,palettes);

@override
String toString() {
  return 'Figma(description: $description, seed: $seed, coreColors: $coreColors, extendedColors: $extendedColors, schemes: $schemes, palettes: $palettes)';
}


}

/// @nodoc
abstract mixin class $FigmaCopyWith<$Res>  {
  factory $FigmaCopyWith(Figma value, $Res Function(Figma) _then) = _$FigmaCopyWithImpl;
@useResult
$Res call({
 String description,@ColorConverter() Color seed, FigmaCoreColors coreColors, List<FigmaExtendedColor> extendedColors, FigmaSchemes schemes, FigmaPalettes palettes
});


$FigmaCoreColorsCopyWith<$Res> get coreColors;$FigmaSchemesCopyWith<$Res> get schemes;$FigmaPalettesCopyWith<$Res> get palettes;

}
/// @nodoc
class _$FigmaCopyWithImpl<$Res>
    implements $FigmaCopyWith<$Res> {
  _$FigmaCopyWithImpl(this._self, this._then);

  final Figma _self;
  final $Res Function(Figma) _then;

/// Create a copy of Figma
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? description = null,Object? seed = null,Object? coreColors = null,Object? extendedColors = null,Object? schemes = null,Object? palettes = null,}) {
  return _then(_self.copyWith(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Color,coreColors: null == coreColors ? _self.coreColors : coreColors // ignore: cast_nullable_to_non_nullable
as FigmaCoreColors,extendedColors: null == extendedColors ? _self.extendedColors : extendedColors // ignore: cast_nullable_to_non_nullable
as List<FigmaExtendedColor>,schemes: null == schemes ? _self.schemes : schemes // ignore: cast_nullable_to_non_nullable
as FigmaSchemes,palettes: null == palettes ? _self.palettes : palettes // ignore: cast_nullable_to_non_nullable
as FigmaPalettes,
  ));
}
/// Create a copy of Figma
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaCoreColorsCopyWith<$Res> get coreColors {
  
  return $FigmaCoreColorsCopyWith<$Res>(_self.coreColors, (value) {
    return _then(_self.copyWith(coreColors: value));
  });
}/// Create a copy of Figma
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaSchemesCopyWith<$Res> get schemes {
  
  return $FigmaSchemesCopyWith<$Res>(_self.schemes, (value) {
    return _then(_self.copyWith(schemes: value));
  });
}/// Create a copy of Figma
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaPalettesCopyWith<$Res> get palettes {
  
  return $FigmaPalettesCopyWith<$Res>(_self.palettes, (value) {
    return _then(_self.copyWith(palettes: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Figma implements Figma {
  const _Figma({this.description = "", @ColorConverter() required this.seed, required this.coreColors, final  List<FigmaExtendedColor> extendedColors = const [], required this.schemes, required this.palettes}): _extendedColors = extendedColors;
  factory _Figma.fromJson(Map<String, dynamic> json) => _$FigmaFromJson(json);

@override@JsonKey() final  String description;
@override@ColorConverter() final  Color seed;
@override final  FigmaCoreColors coreColors;
 final  List<FigmaExtendedColor> _extendedColors;
@override@JsonKey() List<FigmaExtendedColor> get extendedColors {
  if (_extendedColors is EqualUnmodifiableListView) return _extendedColors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_extendedColors);
}

@override final  FigmaSchemes schemes;
@override final  FigmaPalettes palettes;

/// Create a copy of Figma
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FigmaCopyWith<_Figma> get copyWith => __$FigmaCopyWithImpl<_Figma>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FigmaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Figma&&(identical(other.description, description) || other.description == description)&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.coreColors, coreColors) || other.coreColors == coreColors)&&const DeepCollectionEquality().equals(other._extendedColors, _extendedColors)&&(identical(other.schemes, schemes) || other.schemes == schemes)&&(identical(other.palettes, palettes) || other.palettes == palettes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description,seed,coreColors,const DeepCollectionEquality().hash(_extendedColors),schemes,palettes);

@override
String toString() {
  return 'Figma(description: $description, seed: $seed, coreColors: $coreColors, extendedColors: $extendedColors, schemes: $schemes, palettes: $palettes)';
}


}

/// @nodoc
abstract mixin class _$FigmaCopyWith<$Res> implements $FigmaCopyWith<$Res> {
  factory _$FigmaCopyWith(_Figma value, $Res Function(_Figma) _then) = __$FigmaCopyWithImpl;
@override @useResult
$Res call({
 String description,@ColorConverter() Color seed, FigmaCoreColors coreColors, List<FigmaExtendedColor> extendedColors, FigmaSchemes schemes, FigmaPalettes palettes
});


@override $FigmaCoreColorsCopyWith<$Res> get coreColors;@override $FigmaSchemesCopyWith<$Res> get schemes;@override $FigmaPalettesCopyWith<$Res> get palettes;

}
/// @nodoc
class __$FigmaCopyWithImpl<$Res>
    implements _$FigmaCopyWith<$Res> {
  __$FigmaCopyWithImpl(this._self, this._then);

  final _Figma _self;
  final $Res Function(_Figma) _then;

/// Create a copy of Figma
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? description = null,Object? seed = null,Object? coreColors = null,Object? extendedColors = null,Object? schemes = null,Object? palettes = null,}) {
  return _then(_Figma(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Color,coreColors: null == coreColors ? _self.coreColors : coreColors // ignore: cast_nullable_to_non_nullable
as FigmaCoreColors,extendedColors: null == extendedColors ? _self._extendedColors : extendedColors // ignore: cast_nullable_to_non_nullable
as List<FigmaExtendedColor>,schemes: null == schemes ? _self.schemes : schemes // ignore: cast_nullable_to_non_nullable
as FigmaSchemes,palettes: null == palettes ? _self.palettes : palettes // ignore: cast_nullable_to_non_nullable
as FigmaPalettes,
  ));
}

/// Create a copy of Figma
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaCoreColorsCopyWith<$Res> get coreColors {
  
  return $FigmaCoreColorsCopyWith<$Res>(_self.coreColors, (value) {
    return _then(_self.copyWith(coreColors: value));
  });
}/// Create a copy of Figma
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaSchemesCopyWith<$Res> get schemes {
  
  return $FigmaSchemesCopyWith<$Res>(_self.schemes, (value) {
    return _then(_self.copyWith(schemes: value));
  });
}/// Create a copy of Figma
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaPalettesCopyWith<$Res> get palettes {
  
  return $FigmaPalettesCopyWith<$Res>(_self.palettes, (value) {
    return _then(_self.copyWith(palettes: value));
  });
}
}


/// @nodoc
mixin _$FigmaCoreColors {

@JsonKey(includeIfNull: false)@ColorConverter() Color? get primary;@JsonKey(includeIfNull: false)@ColorConverter() Color? get secondary;@JsonKey(includeIfNull: false)@ColorConverter() Color? get tertiary;@JsonKey(includeIfNull: false)@ColorConverter() Color? get neutral;@JsonKey(includeIfNull: false)@ColorConverter() Color? get neutralVariant;@JsonKey(includeIfNull: false)@ColorConverter() Color? get error;
/// Create a copy of FigmaCoreColors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FigmaCoreColorsCopyWith<FigmaCoreColors> get copyWith => _$FigmaCoreColorsCopyWithImpl<FigmaCoreColors>(this as FigmaCoreColors, _$identity);

  /// Serializes this FigmaCoreColors to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FigmaCoreColors&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary)&&(identical(other.tertiary, tertiary) || other.tertiary == tertiary)&&(identical(other.neutral, neutral) || other.neutral == neutral)&&(identical(other.neutralVariant, neutralVariant) || other.neutralVariant == neutralVariant)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primary,secondary,tertiary,neutral,neutralVariant,error);

@override
String toString() {
  return 'FigmaCoreColors(primary: $primary, secondary: $secondary, tertiary: $tertiary, neutral: $neutral, neutralVariant: $neutralVariant, error: $error)';
}


}

/// @nodoc
abstract mixin class $FigmaCoreColorsCopyWith<$Res>  {
  factory $FigmaCoreColorsCopyWith(FigmaCoreColors value, $Res Function(FigmaCoreColors) _then) = _$FigmaCoreColorsCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false)@ColorConverter() Color? primary,@JsonKey(includeIfNull: false)@ColorConverter() Color? secondary,@JsonKey(includeIfNull: false)@ColorConverter() Color? tertiary,@JsonKey(includeIfNull: false)@ColorConverter() Color? neutral,@JsonKey(includeIfNull: false)@ColorConverter() Color? neutralVariant,@JsonKey(includeIfNull: false)@ColorConverter() Color? error
});




}
/// @nodoc
class _$FigmaCoreColorsCopyWithImpl<$Res>
    implements $FigmaCoreColorsCopyWith<$Res> {
  _$FigmaCoreColorsCopyWithImpl(this._self, this._then);

  final FigmaCoreColors _self;
  final $Res Function(FigmaCoreColors) _then;

/// Create a copy of FigmaCoreColors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primary = freezed,Object? secondary = freezed,Object? tertiary = freezed,Object? neutral = freezed,Object? neutralVariant = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
primary: freezed == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color?,secondary: freezed == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color?,tertiary: freezed == tertiary ? _self.tertiary : tertiary // ignore: cast_nullable_to_non_nullable
as Color?,neutral: freezed == neutral ? _self.neutral : neutral // ignore: cast_nullable_to_non_nullable
as Color?,neutralVariant: freezed == neutralVariant ? _self.neutralVariant : neutralVariant // ignore: cast_nullable_to_non_nullable
as Color?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FigmaCoreColors implements FigmaCoreColors {
  const _FigmaCoreColors({@JsonKey(includeIfNull: false)@ColorConverter() this.primary, @JsonKey(includeIfNull: false)@ColorConverter() this.secondary, @JsonKey(includeIfNull: false)@ColorConverter() this.tertiary, @JsonKey(includeIfNull: false)@ColorConverter() this.neutral, @JsonKey(includeIfNull: false)@ColorConverter() this.neutralVariant, @JsonKey(includeIfNull: false)@ColorConverter() this.error});
  factory _FigmaCoreColors.fromJson(Map<String, dynamic> json) => _$FigmaCoreColorsFromJson(json);

@override@JsonKey(includeIfNull: false)@ColorConverter() final  Color? primary;
@override@JsonKey(includeIfNull: false)@ColorConverter() final  Color? secondary;
@override@JsonKey(includeIfNull: false)@ColorConverter() final  Color? tertiary;
@override@JsonKey(includeIfNull: false)@ColorConverter() final  Color? neutral;
@override@JsonKey(includeIfNull: false)@ColorConverter() final  Color? neutralVariant;
@override@JsonKey(includeIfNull: false)@ColorConverter() final  Color? error;

/// Create a copy of FigmaCoreColors
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FigmaCoreColorsCopyWith<_FigmaCoreColors> get copyWith => __$FigmaCoreColorsCopyWithImpl<_FigmaCoreColors>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FigmaCoreColorsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FigmaCoreColors&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary)&&(identical(other.tertiary, tertiary) || other.tertiary == tertiary)&&(identical(other.neutral, neutral) || other.neutral == neutral)&&(identical(other.neutralVariant, neutralVariant) || other.neutralVariant == neutralVariant)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primary,secondary,tertiary,neutral,neutralVariant,error);

@override
String toString() {
  return 'FigmaCoreColors(primary: $primary, secondary: $secondary, tertiary: $tertiary, neutral: $neutral, neutralVariant: $neutralVariant, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FigmaCoreColorsCopyWith<$Res> implements $FigmaCoreColorsCopyWith<$Res> {
  factory _$FigmaCoreColorsCopyWith(_FigmaCoreColors value, $Res Function(_FigmaCoreColors) _then) = __$FigmaCoreColorsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false)@ColorConverter() Color? primary,@JsonKey(includeIfNull: false)@ColorConverter() Color? secondary,@JsonKey(includeIfNull: false)@ColorConverter() Color? tertiary,@JsonKey(includeIfNull: false)@ColorConverter() Color? neutral,@JsonKey(includeIfNull: false)@ColorConverter() Color? neutralVariant,@JsonKey(includeIfNull: false)@ColorConverter() Color? error
});




}
/// @nodoc
class __$FigmaCoreColorsCopyWithImpl<$Res>
    implements _$FigmaCoreColorsCopyWith<$Res> {
  __$FigmaCoreColorsCopyWithImpl(this._self, this._then);

  final _FigmaCoreColors _self;
  final $Res Function(_FigmaCoreColors) _then;

/// Create a copy of FigmaCoreColors
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primary = freezed,Object? secondary = freezed,Object? tertiary = freezed,Object? neutral = freezed,Object? neutralVariant = freezed,Object? error = freezed,}) {
  return _then(_FigmaCoreColors(
primary: freezed == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color?,secondary: freezed == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color?,tertiary: freezed == tertiary ? _self.tertiary : tertiary // ignore: cast_nullable_to_non_nullable
as Color?,neutral: freezed == neutral ? _self.neutral : neutral // ignore: cast_nullable_to_non_nullable
as Color?,neutralVariant: freezed == neutralVariant ? _self.neutralVariant : neutralVariant // ignore: cast_nullable_to_non_nullable
as Color?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}


}


/// @nodoc
mixin _$FigmaExtendedColor {

 String get name;@ColorConverter() Color get color; String get description; bool get harmonized;
/// Create a copy of FigmaExtendedColor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FigmaExtendedColorCopyWith<FigmaExtendedColor> get copyWith => _$FigmaExtendedColorCopyWithImpl<FigmaExtendedColor>(this as FigmaExtendedColor, _$identity);

  /// Serializes this FigmaExtendedColor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FigmaExtendedColor&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.description, description) || other.description == description)&&(identical(other.harmonized, harmonized) || other.harmonized == harmonized));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,color,description,harmonized);

@override
String toString() {
  return 'FigmaExtendedColor(name: $name, color: $color, description: $description, harmonized: $harmonized)';
}


}

/// @nodoc
abstract mixin class $FigmaExtendedColorCopyWith<$Res>  {
  factory $FigmaExtendedColorCopyWith(FigmaExtendedColor value, $Res Function(FigmaExtendedColor) _then) = _$FigmaExtendedColorCopyWithImpl;
@useResult
$Res call({
 String name,@ColorConverter() Color color, String description, bool harmonized
});




}
/// @nodoc
class _$FigmaExtendedColorCopyWithImpl<$Res>
    implements $FigmaExtendedColorCopyWith<$Res> {
  _$FigmaExtendedColorCopyWithImpl(this._self, this._then);

  final FigmaExtendedColor _self;
  final $Res Function(FigmaExtendedColor) _then;

/// Create a copy of FigmaExtendedColor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? color = null,Object? description = null,Object? harmonized = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,harmonized: null == harmonized ? _self.harmonized : harmonized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FigmaExtendedColor implements FigmaExtendedColor {
  const _FigmaExtendedColor({required this.name, @ColorConverter() required this.color, this.description = "", this.harmonized = false});
  factory _FigmaExtendedColor.fromJson(Map<String, dynamic> json) => _$FigmaExtendedColorFromJson(json);

@override final  String name;
@override@ColorConverter() final  Color color;
@override@JsonKey() final  String description;
@override@JsonKey() final  bool harmonized;

/// Create a copy of FigmaExtendedColor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FigmaExtendedColorCopyWith<_FigmaExtendedColor> get copyWith => __$FigmaExtendedColorCopyWithImpl<_FigmaExtendedColor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FigmaExtendedColorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FigmaExtendedColor&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.description, description) || other.description == description)&&(identical(other.harmonized, harmonized) || other.harmonized == harmonized));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,color,description,harmonized);

@override
String toString() {
  return 'FigmaExtendedColor(name: $name, color: $color, description: $description, harmonized: $harmonized)';
}


}

/// @nodoc
abstract mixin class _$FigmaExtendedColorCopyWith<$Res> implements $FigmaExtendedColorCopyWith<$Res> {
  factory _$FigmaExtendedColorCopyWith(_FigmaExtendedColor value, $Res Function(_FigmaExtendedColor) _then) = __$FigmaExtendedColorCopyWithImpl;
@override @useResult
$Res call({
 String name,@ColorConverter() Color color, String description, bool harmonized
});




}
/// @nodoc
class __$FigmaExtendedColorCopyWithImpl<$Res>
    implements _$FigmaExtendedColorCopyWith<$Res> {
  __$FigmaExtendedColorCopyWithImpl(this._self, this._then);

  final _FigmaExtendedColor _self;
  final $Res Function(_FigmaExtendedColor) _then;

/// Create a copy of FigmaExtendedColor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? color = null,Object? description = null,Object? harmonized = null,}) {
  return _then(_FigmaExtendedColor(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,harmonized: null == harmonized ? _self.harmonized : harmonized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$FigmaSchemes {

 FigmaScheme get light; FigmaScheme get lightMediumContrast; FigmaScheme get lightHighContrast; FigmaScheme get dark; FigmaScheme get darkMediumContrast; FigmaScheme get darkHighContrast;
/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FigmaSchemesCopyWith<FigmaSchemes> get copyWith => _$FigmaSchemesCopyWithImpl<FigmaSchemes>(this as FigmaSchemes, _$identity);

  /// Serializes this FigmaSchemes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FigmaSchemes&&(identical(other.light, light) || other.light == light)&&(identical(other.lightMediumContrast, lightMediumContrast) || other.lightMediumContrast == lightMediumContrast)&&(identical(other.lightHighContrast, lightHighContrast) || other.lightHighContrast == lightHighContrast)&&(identical(other.dark, dark) || other.dark == dark)&&(identical(other.darkMediumContrast, darkMediumContrast) || other.darkMediumContrast == darkMediumContrast)&&(identical(other.darkHighContrast, darkHighContrast) || other.darkHighContrast == darkHighContrast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,light,lightMediumContrast,lightHighContrast,dark,darkMediumContrast,darkHighContrast);

@override
String toString() {
  return 'FigmaSchemes(light: $light, lightMediumContrast: $lightMediumContrast, lightHighContrast: $lightHighContrast, dark: $dark, darkMediumContrast: $darkMediumContrast, darkHighContrast: $darkHighContrast)';
}


}

/// @nodoc
abstract mixin class $FigmaSchemesCopyWith<$Res>  {
  factory $FigmaSchemesCopyWith(FigmaSchemes value, $Res Function(FigmaSchemes) _then) = _$FigmaSchemesCopyWithImpl;
@useResult
$Res call({
 FigmaScheme light, FigmaScheme lightMediumContrast, FigmaScheme lightHighContrast, FigmaScheme dark, FigmaScheme darkMediumContrast, FigmaScheme darkHighContrast
});


$FigmaSchemeCopyWith<$Res> get light;$FigmaSchemeCopyWith<$Res> get lightMediumContrast;$FigmaSchemeCopyWith<$Res> get lightHighContrast;$FigmaSchemeCopyWith<$Res> get dark;$FigmaSchemeCopyWith<$Res> get darkMediumContrast;$FigmaSchemeCopyWith<$Res> get darkHighContrast;

}
/// @nodoc
class _$FigmaSchemesCopyWithImpl<$Res>
    implements $FigmaSchemesCopyWith<$Res> {
  _$FigmaSchemesCopyWithImpl(this._self, this._then);

  final FigmaSchemes _self;
  final $Res Function(FigmaSchemes) _then;

/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? light = null,Object? lightMediumContrast = null,Object? lightHighContrast = null,Object? dark = null,Object? darkMediumContrast = null,Object? darkHighContrast = null,}) {
  return _then(_self.copyWith(
light: null == light ? _self.light : light // ignore: cast_nullable_to_non_nullable
as FigmaScheme,lightMediumContrast: null == lightMediumContrast ? _self.lightMediumContrast : lightMediumContrast // ignore: cast_nullable_to_non_nullable
as FigmaScheme,lightHighContrast: null == lightHighContrast ? _self.lightHighContrast : lightHighContrast // ignore: cast_nullable_to_non_nullable
as FigmaScheme,dark: null == dark ? _self.dark : dark // ignore: cast_nullable_to_non_nullable
as FigmaScheme,darkMediumContrast: null == darkMediumContrast ? _self.darkMediumContrast : darkMediumContrast // ignore: cast_nullable_to_non_nullable
as FigmaScheme,darkHighContrast: null == darkHighContrast ? _self.darkHighContrast : darkHighContrast // ignore: cast_nullable_to_non_nullable
as FigmaScheme,
  ));
}
/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaSchemeCopyWith<$Res> get light {
  
  return $FigmaSchemeCopyWith<$Res>(_self.light, (value) {
    return _then(_self.copyWith(light: value));
  });
}/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaSchemeCopyWith<$Res> get lightMediumContrast {
  
  return $FigmaSchemeCopyWith<$Res>(_self.lightMediumContrast, (value) {
    return _then(_self.copyWith(lightMediumContrast: value));
  });
}/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaSchemeCopyWith<$Res> get lightHighContrast {
  
  return $FigmaSchemeCopyWith<$Res>(_self.lightHighContrast, (value) {
    return _then(_self.copyWith(lightHighContrast: value));
  });
}/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaSchemeCopyWith<$Res> get dark {
  
  return $FigmaSchemeCopyWith<$Res>(_self.dark, (value) {
    return _then(_self.copyWith(dark: value));
  });
}/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaSchemeCopyWith<$Res> get darkMediumContrast {
  
  return $FigmaSchemeCopyWith<$Res>(_self.darkMediumContrast, (value) {
    return _then(_self.copyWith(darkMediumContrast: value));
  });
}/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaSchemeCopyWith<$Res> get darkHighContrast {
  
  return $FigmaSchemeCopyWith<$Res>(_self.darkHighContrast, (value) {
    return _then(_self.copyWith(darkHighContrast: value));
  });
}
}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.kebab)
class _FigmaSchemes implements FigmaSchemes {
  const _FigmaSchemes({required this.light, required this.lightMediumContrast, required this.lightHighContrast, required this.dark, required this.darkMediumContrast, required this.darkHighContrast});
  factory _FigmaSchemes.fromJson(Map<String, dynamic> json) => _$FigmaSchemesFromJson(json);

@override final  FigmaScheme light;
@override final  FigmaScheme lightMediumContrast;
@override final  FigmaScheme lightHighContrast;
@override final  FigmaScheme dark;
@override final  FigmaScheme darkMediumContrast;
@override final  FigmaScheme darkHighContrast;

/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FigmaSchemesCopyWith<_FigmaSchemes> get copyWith => __$FigmaSchemesCopyWithImpl<_FigmaSchemes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FigmaSchemesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FigmaSchemes&&(identical(other.light, light) || other.light == light)&&(identical(other.lightMediumContrast, lightMediumContrast) || other.lightMediumContrast == lightMediumContrast)&&(identical(other.lightHighContrast, lightHighContrast) || other.lightHighContrast == lightHighContrast)&&(identical(other.dark, dark) || other.dark == dark)&&(identical(other.darkMediumContrast, darkMediumContrast) || other.darkMediumContrast == darkMediumContrast)&&(identical(other.darkHighContrast, darkHighContrast) || other.darkHighContrast == darkHighContrast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,light,lightMediumContrast,lightHighContrast,dark,darkMediumContrast,darkHighContrast);

@override
String toString() {
  return 'FigmaSchemes(light: $light, lightMediumContrast: $lightMediumContrast, lightHighContrast: $lightHighContrast, dark: $dark, darkMediumContrast: $darkMediumContrast, darkHighContrast: $darkHighContrast)';
}


}

/// @nodoc
abstract mixin class _$FigmaSchemesCopyWith<$Res> implements $FigmaSchemesCopyWith<$Res> {
  factory _$FigmaSchemesCopyWith(_FigmaSchemes value, $Res Function(_FigmaSchemes) _then) = __$FigmaSchemesCopyWithImpl;
@override @useResult
$Res call({
 FigmaScheme light, FigmaScheme lightMediumContrast, FigmaScheme lightHighContrast, FigmaScheme dark, FigmaScheme darkMediumContrast, FigmaScheme darkHighContrast
});


@override $FigmaSchemeCopyWith<$Res> get light;@override $FigmaSchemeCopyWith<$Res> get lightMediumContrast;@override $FigmaSchemeCopyWith<$Res> get lightHighContrast;@override $FigmaSchemeCopyWith<$Res> get dark;@override $FigmaSchemeCopyWith<$Res> get darkMediumContrast;@override $FigmaSchemeCopyWith<$Res> get darkHighContrast;

}
/// @nodoc
class __$FigmaSchemesCopyWithImpl<$Res>
    implements _$FigmaSchemesCopyWith<$Res> {
  __$FigmaSchemesCopyWithImpl(this._self, this._then);

  final _FigmaSchemes _self;
  final $Res Function(_FigmaSchemes) _then;

/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? light = null,Object? lightMediumContrast = null,Object? lightHighContrast = null,Object? dark = null,Object? darkMediumContrast = null,Object? darkHighContrast = null,}) {
  return _then(_FigmaSchemes(
light: null == light ? _self.light : light // ignore: cast_nullable_to_non_nullable
as FigmaScheme,lightMediumContrast: null == lightMediumContrast ? _self.lightMediumContrast : lightMediumContrast // ignore: cast_nullable_to_non_nullable
as FigmaScheme,lightHighContrast: null == lightHighContrast ? _self.lightHighContrast : lightHighContrast // ignore: cast_nullable_to_non_nullable
as FigmaScheme,dark: null == dark ? _self.dark : dark // ignore: cast_nullable_to_non_nullable
as FigmaScheme,darkMediumContrast: null == darkMediumContrast ? _self.darkMediumContrast : darkMediumContrast // ignore: cast_nullable_to_non_nullable
as FigmaScheme,darkHighContrast: null == darkHighContrast ? _self.darkHighContrast : darkHighContrast // ignore: cast_nullable_to_non_nullable
as FigmaScheme,
  ));
}

/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaSchemeCopyWith<$Res> get light {
  
  return $FigmaSchemeCopyWith<$Res>(_self.light, (value) {
    return _then(_self.copyWith(light: value));
  });
}/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaSchemeCopyWith<$Res> get lightMediumContrast {
  
  return $FigmaSchemeCopyWith<$Res>(_self.lightMediumContrast, (value) {
    return _then(_self.copyWith(lightMediumContrast: value));
  });
}/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaSchemeCopyWith<$Res> get lightHighContrast {
  
  return $FigmaSchemeCopyWith<$Res>(_self.lightHighContrast, (value) {
    return _then(_self.copyWith(lightHighContrast: value));
  });
}/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaSchemeCopyWith<$Res> get dark {
  
  return $FigmaSchemeCopyWith<$Res>(_self.dark, (value) {
    return _then(_self.copyWith(dark: value));
  });
}/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaSchemeCopyWith<$Res> get darkMediumContrast {
  
  return $FigmaSchemeCopyWith<$Res>(_self.darkMediumContrast, (value) {
    return _then(_self.copyWith(darkMediumContrast: value));
  });
}/// Create a copy of FigmaSchemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaSchemeCopyWith<$Res> get darkHighContrast {
  
  return $FigmaSchemeCopyWith<$Res>(_self.darkHighContrast, (value) {
    return _then(_self.copyWith(darkHighContrast: value));
  });
}
}


/// @nodoc
mixin _$FigmaScheme {

@ColorConverter() Color get primary;@ColorConverter() Color get surfaceTint;@ColorConverter() Color get onPrimary;@ColorConverter() Color get primaryContainer;@ColorConverter() Color get onPrimaryContainer;@ColorConverter() Color get secondary;@ColorConverter() Color get onSecondary;@ColorConverter() Color get secondaryContainer;@ColorConverter() Color get onSecondaryContainer;@ColorConverter() Color get tertiary;@ColorConverter() Color get onTertiary;@ColorConverter() Color get tertiaryContainer;@ColorConverter() Color get onTertiaryContainer;@ColorConverter() Color get error;@ColorConverter() Color get onError;@ColorConverter() Color get errorContainer;@ColorConverter() Color get onErrorContainer;@ColorConverter() Color get background;@ColorConverter() Color get onBackground;@ColorConverter() Color get surface;@ColorConverter() Color get onSurface;@ColorConverter() Color get surfaceVariant;@ColorConverter() Color get onSurfaceVariant;@ColorConverter() Color get outline;@ColorConverter() Color get outlineVariant;@ColorConverter() Color get shadow;@ColorConverter() Color get scrim;@ColorConverter() Color get inverseSurface;@ColorConverter() Color get inverseOnSurface;@ColorConverter() Color get inversePrimary;@ColorConverter() Color get primaryFixed;@ColorConverter() Color get onPrimaryFixed;@ColorConverter() Color get primaryFixedDim;@ColorConverter() Color get onPrimaryFixedVariant;@ColorConverter() Color get secondaryFixed;@ColorConverter() Color get onSecondaryFixed;@ColorConverter() Color get secondaryFixedDim;@ColorConverter() Color get onSecondaryFixedVariant;@ColorConverter() Color get tertiaryFixed;@ColorConverter() Color get onTertiaryFixed;@ColorConverter() Color get tertiaryFixedDim;@ColorConverter() Color get onTertiaryFixedVariant;@ColorConverter() Color get surfaceDim;@ColorConverter() Color get surfaceBright;@ColorConverter() Color get surfaceContainerLowest;@ColorConverter() Color get surfaceContainerLow;@ColorConverter() Color get surfaceContainer;@ColorConverter() Color get surfaceContainerHigh;@ColorConverter() Color get surfaceContainerHighest;
/// Create a copy of FigmaScheme
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FigmaSchemeCopyWith<FigmaScheme> get copyWith => _$FigmaSchemeCopyWithImpl<FigmaScheme>(this as FigmaScheme, _$identity);

  /// Serializes this FigmaScheme to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FigmaScheme&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.surfaceTint, surfaceTint) || other.surfaceTint == surfaceTint)&&(identical(other.onPrimary, onPrimary) || other.onPrimary == onPrimary)&&(identical(other.primaryContainer, primaryContainer) || other.primaryContainer == primaryContainer)&&(identical(other.onPrimaryContainer, onPrimaryContainer) || other.onPrimaryContainer == onPrimaryContainer)&&(identical(other.secondary, secondary) || other.secondary == secondary)&&(identical(other.onSecondary, onSecondary) || other.onSecondary == onSecondary)&&(identical(other.secondaryContainer, secondaryContainer) || other.secondaryContainer == secondaryContainer)&&(identical(other.onSecondaryContainer, onSecondaryContainer) || other.onSecondaryContainer == onSecondaryContainer)&&(identical(other.tertiary, tertiary) || other.tertiary == tertiary)&&(identical(other.onTertiary, onTertiary) || other.onTertiary == onTertiary)&&(identical(other.tertiaryContainer, tertiaryContainer) || other.tertiaryContainer == tertiaryContainer)&&(identical(other.onTertiaryContainer, onTertiaryContainer) || other.onTertiaryContainer == onTertiaryContainer)&&(identical(other.error, error) || other.error == error)&&(identical(other.onError, onError) || other.onError == onError)&&(identical(other.errorContainer, errorContainer) || other.errorContainer == errorContainer)&&(identical(other.onErrorContainer, onErrorContainer) || other.onErrorContainer == onErrorContainer)&&(identical(other.background, background) || other.background == background)&&(identical(other.onBackground, onBackground) || other.onBackground == onBackground)&&(identical(other.surface, surface) || other.surface == surface)&&(identical(other.onSurface, onSurface) || other.onSurface == onSurface)&&(identical(other.surfaceVariant, surfaceVariant) || other.surfaceVariant == surfaceVariant)&&(identical(other.onSurfaceVariant, onSurfaceVariant) || other.onSurfaceVariant == onSurfaceVariant)&&(identical(other.outline, outline) || other.outline == outline)&&(identical(other.outlineVariant, outlineVariant) || other.outlineVariant == outlineVariant)&&(identical(other.shadow, shadow) || other.shadow == shadow)&&(identical(other.scrim, scrim) || other.scrim == scrim)&&(identical(other.inverseSurface, inverseSurface) || other.inverseSurface == inverseSurface)&&(identical(other.inverseOnSurface, inverseOnSurface) || other.inverseOnSurface == inverseOnSurface)&&(identical(other.inversePrimary, inversePrimary) || other.inversePrimary == inversePrimary)&&(identical(other.primaryFixed, primaryFixed) || other.primaryFixed == primaryFixed)&&(identical(other.onPrimaryFixed, onPrimaryFixed) || other.onPrimaryFixed == onPrimaryFixed)&&(identical(other.primaryFixedDim, primaryFixedDim) || other.primaryFixedDim == primaryFixedDim)&&(identical(other.onPrimaryFixedVariant, onPrimaryFixedVariant) || other.onPrimaryFixedVariant == onPrimaryFixedVariant)&&(identical(other.secondaryFixed, secondaryFixed) || other.secondaryFixed == secondaryFixed)&&(identical(other.onSecondaryFixed, onSecondaryFixed) || other.onSecondaryFixed == onSecondaryFixed)&&(identical(other.secondaryFixedDim, secondaryFixedDim) || other.secondaryFixedDim == secondaryFixedDim)&&(identical(other.onSecondaryFixedVariant, onSecondaryFixedVariant) || other.onSecondaryFixedVariant == onSecondaryFixedVariant)&&(identical(other.tertiaryFixed, tertiaryFixed) || other.tertiaryFixed == tertiaryFixed)&&(identical(other.onTertiaryFixed, onTertiaryFixed) || other.onTertiaryFixed == onTertiaryFixed)&&(identical(other.tertiaryFixedDim, tertiaryFixedDim) || other.tertiaryFixedDim == tertiaryFixedDim)&&(identical(other.onTertiaryFixedVariant, onTertiaryFixedVariant) || other.onTertiaryFixedVariant == onTertiaryFixedVariant)&&(identical(other.surfaceDim, surfaceDim) || other.surfaceDim == surfaceDim)&&(identical(other.surfaceBright, surfaceBright) || other.surfaceBright == surfaceBright)&&(identical(other.surfaceContainerLowest, surfaceContainerLowest) || other.surfaceContainerLowest == surfaceContainerLowest)&&(identical(other.surfaceContainerLow, surfaceContainerLow) || other.surfaceContainerLow == surfaceContainerLow)&&(identical(other.surfaceContainer, surfaceContainer) || other.surfaceContainer == surfaceContainer)&&(identical(other.surfaceContainerHigh, surfaceContainerHigh) || other.surfaceContainerHigh == surfaceContainerHigh)&&(identical(other.surfaceContainerHighest, surfaceContainerHighest) || other.surfaceContainerHighest == surfaceContainerHighest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,primary,surfaceTint,onPrimary,primaryContainer,onPrimaryContainer,secondary,onSecondary,secondaryContainer,onSecondaryContainer,tertiary,onTertiary,tertiaryContainer,onTertiaryContainer,error,onError,errorContainer,onErrorContainer,background,onBackground,surface,onSurface,surfaceVariant,onSurfaceVariant,outline,outlineVariant,shadow,scrim,inverseSurface,inverseOnSurface,inversePrimary,primaryFixed,onPrimaryFixed,primaryFixedDim,onPrimaryFixedVariant,secondaryFixed,onSecondaryFixed,secondaryFixedDim,onSecondaryFixedVariant,tertiaryFixed,onTertiaryFixed,tertiaryFixedDim,onTertiaryFixedVariant,surfaceDim,surfaceBright,surfaceContainerLowest,surfaceContainerLow,surfaceContainer,surfaceContainerHigh,surfaceContainerHighest]);

@override
String toString() {
  return 'FigmaScheme(primary: $primary, surfaceTint: $surfaceTint, onPrimary: $onPrimary, primaryContainer: $primaryContainer, onPrimaryContainer: $onPrimaryContainer, secondary: $secondary, onSecondary: $onSecondary, secondaryContainer: $secondaryContainer, onSecondaryContainer: $onSecondaryContainer, tertiary: $tertiary, onTertiary: $onTertiary, tertiaryContainer: $tertiaryContainer, onTertiaryContainer: $onTertiaryContainer, error: $error, onError: $onError, errorContainer: $errorContainer, onErrorContainer: $onErrorContainer, background: $background, onBackground: $onBackground, surface: $surface, onSurface: $onSurface, surfaceVariant: $surfaceVariant, onSurfaceVariant: $onSurfaceVariant, outline: $outline, outlineVariant: $outlineVariant, shadow: $shadow, scrim: $scrim, inverseSurface: $inverseSurface, inverseOnSurface: $inverseOnSurface, inversePrimary: $inversePrimary, primaryFixed: $primaryFixed, onPrimaryFixed: $onPrimaryFixed, primaryFixedDim: $primaryFixedDim, onPrimaryFixedVariant: $onPrimaryFixedVariant, secondaryFixed: $secondaryFixed, onSecondaryFixed: $onSecondaryFixed, secondaryFixedDim: $secondaryFixedDim, onSecondaryFixedVariant: $onSecondaryFixedVariant, tertiaryFixed: $tertiaryFixed, onTertiaryFixed: $onTertiaryFixed, tertiaryFixedDim: $tertiaryFixedDim, onTertiaryFixedVariant: $onTertiaryFixedVariant, surfaceDim: $surfaceDim, surfaceBright: $surfaceBright, surfaceContainerLowest: $surfaceContainerLowest, surfaceContainerLow: $surfaceContainerLow, surfaceContainer: $surfaceContainer, surfaceContainerHigh: $surfaceContainerHigh, surfaceContainerHighest: $surfaceContainerHighest)';
}


}

/// @nodoc
abstract mixin class $FigmaSchemeCopyWith<$Res>  {
  factory $FigmaSchemeCopyWith(FigmaScheme value, $Res Function(FigmaScheme) _then) = _$FigmaSchemeCopyWithImpl;
@useResult
$Res call({
@ColorConverter() Color primary,@ColorConverter() Color surfaceTint,@ColorConverter() Color onPrimary,@ColorConverter() Color primaryContainer,@ColorConverter() Color onPrimaryContainer,@ColorConverter() Color secondary,@ColorConverter() Color onSecondary,@ColorConverter() Color secondaryContainer,@ColorConverter() Color onSecondaryContainer,@ColorConverter() Color tertiary,@ColorConverter() Color onTertiary,@ColorConverter() Color tertiaryContainer,@ColorConverter() Color onTertiaryContainer,@ColorConverter() Color error,@ColorConverter() Color onError,@ColorConverter() Color errorContainer,@ColorConverter() Color onErrorContainer,@ColorConverter() Color background,@ColorConverter() Color onBackground,@ColorConverter() Color surface,@ColorConverter() Color onSurface,@ColorConverter() Color surfaceVariant,@ColorConverter() Color onSurfaceVariant,@ColorConverter() Color outline,@ColorConverter() Color outlineVariant,@ColorConverter() Color shadow,@ColorConverter() Color scrim,@ColorConverter() Color inverseSurface,@ColorConverter() Color inverseOnSurface,@ColorConverter() Color inversePrimary,@ColorConverter() Color primaryFixed,@ColorConverter() Color onPrimaryFixed,@ColorConverter() Color primaryFixedDim,@ColorConverter() Color onPrimaryFixedVariant,@ColorConverter() Color secondaryFixed,@ColorConverter() Color onSecondaryFixed,@ColorConverter() Color secondaryFixedDim,@ColorConverter() Color onSecondaryFixedVariant,@ColorConverter() Color tertiaryFixed,@ColorConverter() Color onTertiaryFixed,@ColorConverter() Color tertiaryFixedDim,@ColorConverter() Color onTertiaryFixedVariant,@ColorConverter() Color surfaceDim,@ColorConverter() Color surfaceBright,@ColorConverter() Color surfaceContainerLowest,@ColorConverter() Color surfaceContainerLow,@ColorConverter() Color surfaceContainer,@ColorConverter() Color surfaceContainerHigh,@ColorConverter() Color surfaceContainerHighest
});




}
/// @nodoc
class _$FigmaSchemeCopyWithImpl<$Res>
    implements $FigmaSchemeCopyWith<$Res> {
  _$FigmaSchemeCopyWithImpl(this._self, this._then);

  final FigmaScheme _self;
  final $Res Function(FigmaScheme) _then;

/// Create a copy of FigmaScheme
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primary = null,Object? surfaceTint = null,Object? onPrimary = null,Object? primaryContainer = null,Object? onPrimaryContainer = null,Object? secondary = null,Object? onSecondary = null,Object? secondaryContainer = null,Object? onSecondaryContainer = null,Object? tertiary = null,Object? onTertiary = null,Object? tertiaryContainer = null,Object? onTertiaryContainer = null,Object? error = null,Object? onError = null,Object? errorContainer = null,Object? onErrorContainer = null,Object? background = null,Object? onBackground = null,Object? surface = null,Object? onSurface = null,Object? surfaceVariant = null,Object? onSurfaceVariant = null,Object? outline = null,Object? outlineVariant = null,Object? shadow = null,Object? scrim = null,Object? inverseSurface = null,Object? inverseOnSurface = null,Object? inversePrimary = null,Object? primaryFixed = null,Object? onPrimaryFixed = null,Object? primaryFixedDim = null,Object? onPrimaryFixedVariant = null,Object? secondaryFixed = null,Object? onSecondaryFixed = null,Object? secondaryFixedDim = null,Object? onSecondaryFixedVariant = null,Object? tertiaryFixed = null,Object? onTertiaryFixed = null,Object? tertiaryFixedDim = null,Object? onTertiaryFixedVariant = null,Object? surfaceDim = null,Object? surfaceBright = null,Object? surfaceContainerLowest = null,Object? surfaceContainerLow = null,Object? surfaceContainer = null,Object? surfaceContainerHigh = null,Object? surfaceContainerHighest = null,}) {
  return _then(_self.copyWith(
primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color,surfaceTint: null == surfaceTint ? _self.surfaceTint : surfaceTint // ignore: cast_nullable_to_non_nullable
as Color,onPrimary: null == onPrimary ? _self.onPrimary : onPrimary // ignore: cast_nullable_to_non_nullable
as Color,primaryContainer: null == primaryContainer ? _self.primaryContainer : primaryContainer // ignore: cast_nullable_to_non_nullable
as Color,onPrimaryContainer: null == onPrimaryContainer ? _self.onPrimaryContainer : onPrimaryContainer // ignore: cast_nullable_to_non_nullable
as Color,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color,onSecondary: null == onSecondary ? _self.onSecondary : onSecondary // ignore: cast_nullable_to_non_nullable
as Color,secondaryContainer: null == secondaryContainer ? _self.secondaryContainer : secondaryContainer // ignore: cast_nullable_to_non_nullable
as Color,onSecondaryContainer: null == onSecondaryContainer ? _self.onSecondaryContainer : onSecondaryContainer // ignore: cast_nullable_to_non_nullable
as Color,tertiary: null == tertiary ? _self.tertiary : tertiary // ignore: cast_nullable_to_non_nullable
as Color,onTertiary: null == onTertiary ? _self.onTertiary : onTertiary // ignore: cast_nullable_to_non_nullable
as Color,tertiaryContainer: null == tertiaryContainer ? _self.tertiaryContainer : tertiaryContainer // ignore: cast_nullable_to_non_nullable
as Color,onTertiaryContainer: null == onTertiaryContainer ? _self.onTertiaryContainer : onTertiaryContainer // ignore: cast_nullable_to_non_nullable
as Color,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Color,onError: null == onError ? _self.onError : onError // ignore: cast_nullable_to_non_nullable
as Color,errorContainer: null == errorContainer ? _self.errorContainer : errorContainer // ignore: cast_nullable_to_non_nullable
as Color,onErrorContainer: null == onErrorContainer ? _self.onErrorContainer : onErrorContainer // ignore: cast_nullable_to_non_nullable
as Color,background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as Color,onBackground: null == onBackground ? _self.onBackground : onBackground // ignore: cast_nullable_to_non_nullable
as Color,surface: null == surface ? _self.surface : surface // ignore: cast_nullable_to_non_nullable
as Color,onSurface: null == onSurface ? _self.onSurface : onSurface // ignore: cast_nullable_to_non_nullable
as Color,surfaceVariant: null == surfaceVariant ? _self.surfaceVariant : surfaceVariant // ignore: cast_nullable_to_non_nullable
as Color,onSurfaceVariant: null == onSurfaceVariant ? _self.onSurfaceVariant : onSurfaceVariant // ignore: cast_nullable_to_non_nullable
as Color,outline: null == outline ? _self.outline : outline // ignore: cast_nullable_to_non_nullable
as Color,outlineVariant: null == outlineVariant ? _self.outlineVariant : outlineVariant // ignore: cast_nullable_to_non_nullable
as Color,shadow: null == shadow ? _self.shadow : shadow // ignore: cast_nullable_to_non_nullable
as Color,scrim: null == scrim ? _self.scrim : scrim // ignore: cast_nullable_to_non_nullable
as Color,inverseSurface: null == inverseSurface ? _self.inverseSurface : inverseSurface // ignore: cast_nullable_to_non_nullable
as Color,inverseOnSurface: null == inverseOnSurface ? _self.inverseOnSurface : inverseOnSurface // ignore: cast_nullable_to_non_nullable
as Color,inversePrimary: null == inversePrimary ? _self.inversePrimary : inversePrimary // ignore: cast_nullable_to_non_nullable
as Color,primaryFixed: null == primaryFixed ? _self.primaryFixed : primaryFixed // ignore: cast_nullable_to_non_nullable
as Color,onPrimaryFixed: null == onPrimaryFixed ? _self.onPrimaryFixed : onPrimaryFixed // ignore: cast_nullable_to_non_nullable
as Color,primaryFixedDim: null == primaryFixedDim ? _self.primaryFixedDim : primaryFixedDim // ignore: cast_nullable_to_non_nullable
as Color,onPrimaryFixedVariant: null == onPrimaryFixedVariant ? _self.onPrimaryFixedVariant : onPrimaryFixedVariant // ignore: cast_nullable_to_non_nullable
as Color,secondaryFixed: null == secondaryFixed ? _self.secondaryFixed : secondaryFixed // ignore: cast_nullable_to_non_nullable
as Color,onSecondaryFixed: null == onSecondaryFixed ? _self.onSecondaryFixed : onSecondaryFixed // ignore: cast_nullable_to_non_nullable
as Color,secondaryFixedDim: null == secondaryFixedDim ? _self.secondaryFixedDim : secondaryFixedDim // ignore: cast_nullable_to_non_nullable
as Color,onSecondaryFixedVariant: null == onSecondaryFixedVariant ? _self.onSecondaryFixedVariant : onSecondaryFixedVariant // ignore: cast_nullable_to_non_nullable
as Color,tertiaryFixed: null == tertiaryFixed ? _self.tertiaryFixed : tertiaryFixed // ignore: cast_nullable_to_non_nullable
as Color,onTertiaryFixed: null == onTertiaryFixed ? _self.onTertiaryFixed : onTertiaryFixed // ignore: cast_nullable_to_non_nullable
as Color,tertiaryFixedDim: null == tertiaryFixedDim ? _self.tertiaryFixedDim : tertiaryFixedDim // ignore: cast_nullable_to_non_nullable
as Color,onTertiaryFixedVariant: null == onTertiaryFixedVariant ? _self.onTertiaryFixedVariant : onTertiaryFixedVariant // ignore: cast_nullable_to_non_nullable
as Color,surfaceDim: null == surfaceDim ? _self.surfaceDim : surfaceDim // ignore: cast_nullable_to_non_nullable
as Color,surfaceBright: null == surfaceBright ? _self.surfaceBright : surfaceBright // ignore: cast_nullable_to_non_nullable
as Color,surfaceContainerLowest: null == surfaceContainerLowest ? _self.surfaceContainerLowest : surfaceContainerLowest // ignore: cast_nullable_to_non_nullable
as Color,surfaceContainerLow: null == surfaceContainerLow ? _self.surfaceContainerLow : surfaceContainerLow // ignore: cast_nullable_to_non_nullable
as Color,surfaceContainer: null == surfaceContainer ? _self.surfaceContainer : surfaceContainer // ignore: cast_nullable_to_non_nullable
as Color,surfaceContainerHigh: null == surfaceContainerHigh ? _self.surfaceContainerHigh : surfaceContainerHigh // ignore: cast_nullable_to_non_nullable
as Color,surfaceContainerHighest: null == surfaceContainerHighest ? _self.surfaceContainerHighest : surfaceContainerHighest // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FigmaScheme implements FigmaScheme {
  const _FigmaScheme({@ColorConverter() required this.primary, @ColorConverter() required this.surfaceTint, @ColorConverter() required this.onPrimary, @ColorConverter() required this.primaryContainer, @ColorConverter() required this.onPrimaryContainer, @ColorConverter() required this.secondary, @ColorConverter() required this.onSecondary, @ColorConverter() required this.secondaryContainer, @ColorConverter() required this.onSecondaryContainer, @ColorConverter() required this.tertiary, @ColorConverter() required this.onTertiary, @ColorConverter() required this.tertiaryContainer, @ColorConverter() required this.onTertiaryContainer, @ColorConverter() required this.error, @ColorConverter() required this.onError, @ColorConverter() required this.errorContainer, @ColorConverter() required this.onErrorContainer, @ColorConverter() required this.background, @ColorConverter() required this.onBackground, @ColorConverter() required this.surface, @ColorConverter() required this.onSurface, @ColorConverter() required this.surfaceVariant, @ColorConverter() required this.onSurfaceVariant, @ColorConverter() required this.outline, @ColorConverter() required this.outlineVariant, @ColorConverter() required this.shadow, @ColorConverter() required this.scrim, @ColorConverter() required this.inverseSurface, @ColorConverter() required this.inverseOnSurface, @ColorConverter() required this.inversePrimary, @ColorConverter() required this.primaryFixed, @ColorConverter() required this.onPrimaryFixed, @ColorConverter() required this.primaryFixedDim, @ColorConverter() required this.onPrimaryFixedVariant, @ColorConverter() required this.secondaryFixed, @ColorConverter() required this.onSecondaryFixed, @ColorConverter() required this.secondaryFixedDim, @ColorConverter() required this.onSecondaryFixedVariant, @ColorConverter() required this.tertiaryFixed, @ColorConverter() required this.onTertiaryFixed, @ColorConverter() required this.tertiaryFixedDim, @ColorConverter() required this.onTertiaryFixedVariant, @ColorConverter() required this.surfaceDim, @ColorConverter() required this.surfaceBright, @ColorConverter() required this.surfaceContainerLowest, @ColorConverter() required this.surfaceContainerLow, @ColorConverter() required this.surfaceContainer, @ColorConverter() required this.surfaceContainerHigh, @ColorConverter() required this.surfaceContainerHighest});
  factory _FigmaScheme.fromJson(Map<String, dynamic> json) => _$FigmaSchemeFromJson(json);

@override@ColorConverter() final  Color primary;
@override@ColorConverter() final  Color surfaceTint;
@override@ColorConverter() final  Color onPrimary;
@override@ColorConverter() final  Color primaryContainer;
@override@ColorConverter() final  Color onPrimaryContainer;
@override@ColorConverter() final  Color secondary;
@override@ColorConverter() final  Color onSecondary;
@override@ColorConverter() final  Color secondaryContainer;
@override@ColorConverter() final  Color onSecondaryContainer;
@override@ColorConverter() final  Color tertiary;
@override@ColorConverter() final  Color onTertiary;
@override@ColorConverter() final  Color tertiaryContainer;
@override@ColorConverter() final  Color onTertiaryContainer;
@override@ColorConverter() final  Color error;
@override@ColorConverter() final  Color onError;
@override@ColorConverter() final  Color errorContainer;
@override@ColorConverter() final  Color onErrorContainer;
@override@ColorConverter() final  Color background;
@override@ColorConverter() final  Color onBackground;
@override@ColorConverter() final  Color surface;
@override@ColorConverter() final  Color onSurface;
@override@ColorConverter() final  Color surfaceVariant;
@override@ColorConverter() final  Color onSurfaceVariant;
@override@ColorConverter() final  Color outline;
@override@ColorConverter() final  Color outlineVariant;
@override@ColorConverter() final  Color shadow;
@override@ColorConverter() final  Color scrim;
@override@ColorConverter() final  Color inverseSurface;
@override@ColorConverter() final  Color inverseOnSurface;
@override@ColorConverter() final  Color inversePrimary;
@override@ColorConverter() final  Color primaryFixed;
@override@ColorConverter() final  Color onPrimaryFixed;
@override@ColorConverter() final  Color primaryFixedDim;
@override@ColorConverter() final  Color onPrimaryFixedVariant;
@override@ColorConverter() final  Color secondaryFixed;
@override@ColorConverter() final  Color onSecondaryFixed;
@override@ColorConverter() final  Color secondaryFixedDim;
@override@ColorConverter() final  Color onSecondaryFixedVariant;
@override@ColorConverter() final  Color tertiaryFixed;
@override@ColorConverter() final  Color onTertiaryFixed;
@override@ColorConverter() final  Color tertiaryFixedDim;
@override@ColorConverter() final  Color onTertiaryFixedVariant;
@override@ColorConverter() final  Color surfaceDim;
@override@ColorConverter() final  Color surfaceBright;
@override@ColorConverter() final  Color surfaceContainerLowest;
@override@ColorConverter() final  Color surfaceContainerLow;
@override@ColorConverter() final  Color surfaceContainer;
@override@ColorConverter() final  Color surfaceContainerHigh;
@override@ColorConverter() final  Color surfaceContainerHighest;

/// Create a copy of FigmaScheme
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FigmaSchemeCopyWith<_FigmaScheme> get copyWith => __$FigmaSchemeCopyWithImpl<_FigmaScheme>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FigmaSchemeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FigmaScheme&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.surfaceTint, surfaceTint) || other.surfaceTint == surfaceTint)&&(identical(other.onPrimary, onPrimary) || other.onPrimary == onPrimary)&&(identical(other.primaryContainer, primaryContainer) || other.primaryContainer == primaryContainer)&&(identical(other.onPrimaryContainer, onPrimaryContainer) || other.onPrimaryContainer == onPrimaryContainer)&&(identical(other.secondary, secondary) || other.secondary == secondary)&&(identical(other.onSecondary, onSecondary) || other.onSecondary == onSecondary)&&(identical(other.secondaryContainer, secondaryContainer) || other.secondaryContainer == secondaryContainer)&&(identical(other.onSecondaryContainer, onSecondaryContainer) || other.onSecondaryContainer == onSecondaryContainer)&&(identical(other.tertiary, tertiary) || other.tertiary == tertiary)&&(identical(other.onTertiary, onTertiary) || other.onTertiary == onTertiary)&&(identical(other.tertiaryContainer, tertiaryContainer) || other.tertiaryContainer == tertiaryContainer)&&(identical(other.onTertiaryContainer, onTertiaryContainer) || other.onTertiaryContainer == onTertiaryContainer)&&(identical(other.error, error) || other.error == error)&&(identical(other.onError, onError) || other.onError == onError)&&(identical(other.errorContainer, errorContainer) || other.errorContainer == errorContainer)&&(identical(other.onErrorContainer, onErrorContainer) || other.onErrorContainer == onErrorContainer)&&(identical(other.background, background) || other.background == background)&&(identical(other.onBackground, onBackground) || other.onBackground == onBackground)&&(identical(other.surface, surface) || other.surface == surface)&&(identical(other.onSurface, onSurface) || other.onSurface == onSurface)&&(identical(other.surfaceVariant, surfaceVariant) || other.surfaceVariant == surfaceVariant)&&(identical(other.onSurfaceVariant, onSurfaceVariant) || other.onSurfaceVariant == onSurfaceVariant)&&(identical(other.outline, outline) || other.outline == outline)&&(identical(other.outlineVariant, outlineVariant) || other.outlineVariant == outlineVariant)&&(identical(other.shadow, shadow) || other.shadow == shadow)&&(identical(other.scrim, scrim) || other.scrim == scrim)&&(identical(other.inverseSurface, inverseSurface) || other.inverseSurface == inverseSurface)&&(identical(other.inverseOnSurface, inverseOnSurface) || other.inverseOnSurface == inverseOnSurface)&&(identical(other.inversePrimary, inversePrimary) || other.inversePrimary == inversePrimary)&&(identical(other.primaryFixed, primaryFixed) || other.primaryFixed == primaryFixed)&&(identical(other.onPrimaryFixed, onPrimaryFixed) || other.onPrimaryFixed == onPrimaryFixed)&&(identical(other.primaryFixedDim, primaryFixedDim) || other.primaryFixedDim == primaryFixedDim)&&(identical(other.onPrimaryFixedVariant, onPrimaryFixedVariant) || other.onPrimaryFixedVariant == onPrimaryFixedVariant)&&(identical(other.secondaryFixed, secondaryFixed) || other.secondaryFixed == secondaryFixed)&&(identical(other.onSecondaryFixed, onSecondaryFixed) || other.onSecondaryFixed == onSecondaryFixed)&&(identical(other.secondaryFixedDim, secondaryFixedDim) || other.secondaryFixedDim == secondaryFixedDim)&&(identical(other.onSecondaryFixedVariant, onSecondaryFixedVariant) || other.onSecondaryFixedVariant == onSecondaryFixedVariant)&&(identical(other.tertiaryFixed, tertiaryFixed) || other.tertiaryFixed == tertiaryFixed)&&(identical(other.onTertiaryFixed, onTertiaryFixed) || other.onTertiaryFixed == onTertiaryFixed)&&(identical(other.tertiaryFixedDim, tertiaryFixedDim) || other.tertiaryFixedDim == tertiaryFixedDim)&&(identical(other.onTertiaryFixedVariant, onTertiaryFixedVariant) || other.onTertiaryFixedVariant == onTertiaryFixedVariant)&&(identical(other.surfaceDim, surfaceDim) || other.surfaceDim == surfaceDim)&&(identical(other.surfaceBright, surfaceBright) || other.surfaceBright == surfaceBright)&&(identical(other.surfaceContainerLowest, surfaceContainerLowest) || other.surfaceContainerLowest == surfaceContainerLowest)&&(identical(other.surfaceContainerLow, surfaceContainerLow) || other.surfaceContainerLow == surfaceContainerLow)&&(identical(other.surfaceContainer, surfaceContainer) || other.surfaceContainer == surfaceContainer)&&(identical(other.surfaceContainerHigh, surfaceContainerHigh) || other.surfaceContainerHigh == surfaceContainerHigh)&&(identical(other.surfaceContainerHighest, surfaceContainerHighest) || other.surfaceContainerHighest == surfaceContainerHighest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,primary,surfaceTint,onPrimary,primaryContainer,onPrimaryContainer,secondary,onSecondary,secondaryContainer,onSecondaryContainer,tertiary,onTertiary,tertiaryContainer,onTertiaryContainer,error,onError,errorContainer,onErrorContainer,background,onBackground,surface,onSurface,surfaceVariant,onSurfaceVariant,outline,outlineVariant,shadow,scrim,inverseSurface,inverseOnSurface,inversePrimary,primaryFixed,onPrimaryFixed,primaryFixedDim,onPrimaryFixedVariant,secondaryFixed,onSecondaryFixed,secondaryFixedDim,onSecondaryFixedVariant,tertiaryFixed,onTertiaryFixed,tertiaryFixedDim,onTertiaryFixedVariant,surfaceDim,surfaceBright,surfaceContainerLowest,surfaceContainerLow,surfaceContainer,surfaceContainerHigh,surfaceContainerHighest]);

@override
String toString() {
  return 'FigmaScheme(primary: $primary, surfaceTint: $surfaceTint, onPrimary: $onPrimary, primaryContainer: $primaryContainer, onPrimaryContainer: $onPrimaryContainer, secondary: $secondary, onSecondary: $onSecondary, secondaryContainer: $secondaryContainer, onSecondaryContainer: $onSecondaryContainer, tertiary: $tertiary, onTertiary: $onTertiary, tertiaryContainer: $tertiaryContainer, onTertiaryContainer: $onTertiaryContainer, error: $error, onError: $onError, errorContainer: $errorContainer, onErrorContainer: $onErrorContainer, background: $background, onBackground: $onBackground, surface: $surface, onSurface: $onSurface, surfaceVariant: $surfaceVariant, onSurfaceVariant: $onSurfaceVariant, outline: $outline, outlineVariant: $outlineVariant, shadow: $shadow, scrim: $scrim, inverseSurface: $inverseSurface, inverseOnSurface: $inverseOnSurface, inversePrimary: $inversePrimary, primaryFixed: $primaryFixed, onPrimaryFixed: $onPrimaryFixed, primaryFixedDim: $primaryFixedDim, onPrimaryFixedVariant: $onPrimaryFixedVariant, secondaryFixed: $secondaryFixed, onSecondaryFixed: $onSecondaryFixed, secondaryFixedDim: $secondaryFixedDim, onSecondaryFixedVariant: $onSecondaryFixedVariant, tertiaryFixed: $tertiaryFixed, onTertiaryFixed: $onTertiaryFixed, tertiaryFixedDim: $tertiaryFixedDim, onTertiaryFixedVariant: $onTertiaryFixedVariant, surfaceDim: $surfaceDim, surfaceBright: $surfaceBright, surfaceContainerLowest: $surfaceContainerLowest, surfaceContainerLow: $surfaceContainerLow, surfaceContainer: $surfaceContainer, surfaceContainerHigh: $surfaceContainerHigh, surfaceContainerHighest: $surfaceContainerHighest)';
}


}

/// @nodoc
abstract mixin class _$FigmaSchemeCopyWith<$Res> implements $FigmaSchemeCopyWith<$Res> {
  factory _$FigmaSchemeCopyWith(_FigmaScheme value, $Res Function(_FigmaScheme) _then) = __$FigmaSchemeCopyWithImpl;
@override @useResult
$Res call({
@ColorConverter() Color primary,@ColorConverter() Color surfaceTint,@ColorConverter() Color onPrimary,@ColorConverter() Color primaryContainer,@ColorConverter() Color onPrimaryContainer,@ColorConverter() Color secondary,@ColorConverter() Color onSecondary,@ColorConverter() Color secondaryContainer,@ColorConverter() Color onSecondaryContainer,@ColorConverter() Color tertiary,@ColorConverter() Color onTertiary,@ColorConverter() Color tertiaryContainer,@ColorConverter() Color onTertiaryContainer,@ColorConverter() Color error,@ColorConverter() Color onError,@ColorConverter() Color errorContainer,@ColorConverter() Color onErrorContainer,@ColorConverter() Color background,@ColorConverter() Color onBackground,@ColorConverter() Color surface,@ColorConverter() Color onSurface,@ColorConverter() Color surfaceVariant,@ColorConverter() Color onSurfaceVariant,@ColorConverter() Color outline,@ColorConverter() Color outlineVariant,@ColorConverter() Color shadow,@ColorConverter() Color scrim,@ColorConverter() Color inverseSurface,@ColorConverter() Color inverseOnSurface,@ColorConverter() Color inversePrimary,@ColorConverter() Color primaryFixed,@ColorConverter() Color onPrimaryFixed,@ColorConverter() Color primaryFixedDim,@ColorConverter() Color onPrimaryFixedVariant,@ColorConverter() Color secondaryFixed,@ColorConverter() Color onSecondaryFixed,@ColorConverter() Color secondaryFixedDim,@ColorConverter() Color onSecondaryFixedVariant,@ColorConverter() Color tertiaryFixed,@ColorConverter() Color onTertiaryFixed,@ColorConverter() Color tertiaryFixedDim,@ColorConverter() Color onTertiaryFixedVariant,@ColorConverter() Color surfaceDim,@ColorConverter() Color surfaceBright,@ColorConverter() Color surfaceContainerLowest,@ColorConverter() Color surfaceContainerLow,@ColorConverter() Color surfaceContainer,@ColorConverter() Color surfaceContainerHigh,@ColorConverter() Color surfaceContainerHighest
});




}
/// @nodoc
class __$FigmaSchemeCopyWithImpl<$Res>
    implements _$FigmaSchemeCopyWith<$Res> {
  __$FigmaSchemeCopyWithImpl(this._self, this._then);

  final _FigmaScheme _self;
  final $Res Function(_FigmaScheme) _then;

/// Create a copy of FigmaScheme
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primary = null,Object? surfaceTint = null,Object? onPrimary = null,Object? primaryContainer = null,Object? onPrimaryContainer = null,Object? secondary = null,Object? onSecondary = null,Object? secondaryContainer = null,Object? onSecondaryContainer = null,Object? tertiary = null,Object? onTertiary = null,Object? tertiaryContainer = null,Object? onTertiaryContainer = null,Object? error = null,Object? onError = null,Object? errorContainer = null,Object? onErrorContainer = null,Object? background = null,Object? onBackground = null,Object? surface = null,Object? onSurface = null,Object? surfaceVariant = null,Object? onSurfaceVariant = null,Object? outline = null,Object? outlineVariant = null,Object? shadow = null,Object? scrim = null,Object? inverseSurface = null,Object? inverseOnSurface = null,Object? inversePrimary = null,Object? primaryFixed = null,Object? onPrimaryFixed = null,Object? primaryFixedDim = null,Object? onPrimaryFixedVariant = null,Object? secondaryFixed = null,Object? onSecondaryFixed = null,Object? secondaryFixedDim = null,Object? onSecondaryFixedVariant = null,Object? tertiaryFixed = null,Object? onTertiaryFixed = null,Object? tertiaryFixedDim = null,Object? onTertiaryFixedVariant = null,Object? surfaceDim = null,Object? surfaceBright = null,Object? surfaceContainerLowest = null,Object? surfaceContainerLow = null,Object? surfaceContainer = null,Object? surfaceContainerHigh = null,Object? surfaceContainerHighest = null,}) {
  return _then(_FigmaScheme(
primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color,surfaceTint: null == surfaceTint ? _self.surfaceTint : surfaceTint // ignore: cast_nullable_to_non_nullable
as Color,onPrimary: null == onPrimary ? _self.onPrimary : onPrimary // ignore: cast_nullable_to_non_nullable
as Color,primaryContainer: null == primaryContainer ? _self.primaryContainer : primaryContainer // ignore: cast_nullable_to_non_nullable
as Color,onPrimaryContainer: null == onPrimaryContainer ? _self.onPrimaryContainer : onPrimaryContainer // ignore: cast_nullable_to_non_nullable
as Color,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color,onSecondary: null == onSecondary ? _self.onSecondary : onSecondary // ignore: cast_nullable_to_non_nullable
as Color,secondaryContainer: null == secondaryContainer ? _self.secondaryContainer : secondaryContainer // ignore: cast_nullable_to_non_nullable
as Color,onSecondaryContainer: null == onSecondaryContainer ? _self.onSecondaryContainer : onSecondaryContainer // ignore: cast_nullable_to_non_nullable
as Color,tertiary: null == tertiary ? _self.tertiary : tertiary // ignore: cast_nullable_to_non_nullable
as Color,onTertiary: null == onTertiary ? _self.onTertiary : onTertiary // ignore: cast_nullable_to_non_nullable
as Color,tertiaryContainer: null == tertiaryContainer ? _self.tertiaryContainer : tertiaryContainer // ignore: cast_nullable_to_non_nullable
as Color,onTertiaryContainer: null == onTertiaryContainer ? _self.onTertiaryContainer : onTertiaryContainer // ignore: cast_nullable_to_non_nullable
as Color,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Color,onError: null == onError ? _self.onError : onError // ignore: cast_nullable_to_non_nullable
as Color,errorContainer: null == errorContainer ? _self.errorContainer : errorContainer // ignore: cast_nullable_to_non_nullable
as Color,onErrorContainer: null == onErrorContainer ? _self.onErrorContainer : onErrorContainer // ignore: cast_nullable_to_non_nullable
as Color,background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as Color,onBackground: null == onBackground ? _self.onBackground : onBackground // ignore: cast_nullable_to_non_nullable
as Color,surface: null == surface ? _self.surface : surface // ignore: cast_nullable_to_non_nullable
as Color,onSurface: null == onSurface ? _self.onSurface : onSurface // ignore: cast_nullable_to_non_nullable
as Color,surfaceVariant: null == surfaceVariant ? _self.surfaceVariant : surfaceVariant // ignore: cast_nullable_to_non_nullable
as Color,onSurfaceVariant: null == onSurfaceVariant ? _self.onSurfaceVariant : onSurfaceVariant // ignore: cast_nullable_to_non_nullable
as Color,outline: null == outline ? _self.outline : outline // ignore: cast_nullable_to_non_nullable
as Color,outlineVariant: null == outlineVariant ? _self.outlineVariant : outlineVariant // ignore: cast_nullable_to_non_nullable
as Color,shadow: null == shadow ? _self.shadow : shadow // ignore: cast_nullable_to_non_nullable
as Color,scrim: null == scrim ? _self.scrim : scrim // ignore: cast_nullable_to_non_nullable
as Color,inverseSurface: null == inverseSurface ? _self.inverseSurface : inverseSurface // ignore: cast_nullable_to_non_nullable
as Color,inverseOnSurface: null == inverseOnSurface ? _self.inverseOnSurface : inverseOnSurface // ignore: cast_nullable_to_non_nullable
as Color,inversePrimary: null == inversePrimary ? _self.inversePrimary : inversePrimary // ignore: cast_nullable_to_non_nullable
as Color,primaryFixed: null == primaryFixed ? _self.primaryFixed : primaryFixed // ignore: cast_nullable_to_non_nullable
as Color,onPrimaryFixed: null == onPrimaryFixed ? _self.onPrimaryFixed : onPrimaryFixed // ignore: cast_nullable_to_non_nullable
as Color,primaryFixedDim: null == primaryFixedDim ? _self.primaryFixedDim : primaryFixedDim // ignore: cast_nullable_to_non_nullable
as Color,onPrimaryFixedVariant: null == onPrimaryFixedVariant ? _self.onPrimaryFixedVariant : onPrimaryFixedVariant // ignore: cast_nullable_to_non_nullable
as Color,secondaryFixed: null == secondaryFixed ? _self.secondaryFixed : secondaryFixed // ignore: cast_nullable_to_non_nullable
as Color,onSecondaryFixed: null == onSecondaryFixed ? _self.onSecondaryFixed : onSecondaryFixed // ignore: cast_nullable_to_non_nullable
as Color,secondaryFixedDim: null == secondaryFixedDim ? _self.secondaryFixedDim : secondaryFixedDim // ignore: cast_nullable_to_non_nullable
as Color,onSecondaryFixedVariant: null == onSecondaryFixedVariant ? _self.onSecondaryFixedVariant : onSecondaryFixedVariant // ignore: cast_nullable_to_non_nullable
as Color,tertiaryFixed: null == tertiaryFixed ? _self.tertiaryFixed : tertiaryFixed // ignore: cast_nullable_to_non_nullable
as Color,onTertiaryFixed: null == onTertiaryFixed ? _self.onTertiaryFixed : onTertiaryFixed // ignore: cast_nullable_to_non_nullable
as Color,tertiaryFixedDim: null == tertiaryFixedDim ? _self.tertiaryFixedDim : tertiaryFixedDim // ignore: cast_nullable_to_non_nullable
as Color,onTertiaryFixedVariant: null == onTertiaryFixedVariant ? _self.onTertiaryFixedVariant : onTertiaryFixedVariant // ignore: cast_nullable_to_non_nullable
as Color,surfaceDim: null == surfaceDim ? _self.surfaceDim : surfaceDim // ignore: cast_nullable_to_non_nullable
as Color,surfaceBright: null == surfaceBright ? _self.surfaceBright : surfaceBright // ignore: cast_nullable_to_non_nullable
as Color,surfaceContainerLowest: null == surfaceContainerLowest ? _self.surfaceContainerLowest : surfaceContainerLowest // ignore: cast_nullable_to_non_nullable
as Color,surfaceContainerLow: null == surfaceContainerLow ? _self.surfaceContainerLow : surfaceContainerLow // ignore: cast_nullable_to_non_nullable
as Color,surfaceContainer: null == surfaceContainer ? _self.surfaceContainer : surfaceContainer // ignore: cast_nullable_to_non_nullable
as Color,surfaceContainerHigh: null == surfaceContainerHigh ? _self.surfaceContainerHigh : surfaceContainerHigh // ignore: cast_nullable_to_non_nullable
as Color,surfaceContainerHighest: null == surfaceContainerHighest ? _self.surfaceContainerHighest : surfaceContainerHighest // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}


/// @nodoc
mixin _$FigmaPalettes {

@JsonKey(includeIfNull: false) FigmaPalette? get primary;@JsonKey(includeIfNull: false) FigmaPalette? get secondary;@JsonKey(includeIfNull: false) FigmaPalette? get tertiary;@JsonKey(includeIfNull: false) FigmaPalette? get neutral;@JsonKey(includeIfNull: false) FigmaPalette? get neutralVariant;@JsonKey(includeIfNull: false) FigmaPalette? get error;
/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FigmaPalettesCopyWith<FigmaPalettes> get copyWith => _$FigmaPalettesCopyWithImpl<FigmaPalettes>(this as FigmaPalettes, _$identity);

  /// Serializes this FigmaPalettes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FigmaPalettes&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary)&&(identical(other.tertiary, tertiary) || other.tertiary == tertiary)&&(identical(other.neutral, neutral) || other.neutral == neutral)&&(identical(other.neutralVariant, neutralVariant) || other.neutralVariant == neutralVariant)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primary,secondary,tertiary,neutral,neutralVariant,error);

@override
String toString() {
  return 'FigmaPalettes(primary: $primary, secondary: $secondary, tertiary: $tertiary, neutral: $neutral, neutralVariant: $neutralVariant, error: $error)';
}


}

/// @nodoc
abstract mixin class $FigmaPalettesCopyWith<$Res>  {
  factory $FigmaPalettesCopyWith(FigmaPalettes value, $Res Function(FigmaPalettes) _then) = _$FigmaPalettesCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) FigmaPalette? primary,@JsonKey(includeIfNull: false) FigmaPalette? secondary,@JsonKey(includeIfNull: false) FigmaPalette? tertiary,@JsonKey(includeIfNull: false) FigmaPalette? neutral,@JsonKey(includeIfNull: false) FigmaPalette? neutralVariant,@JsonKey(includeIfNull: false) FigmaPalette? error
});


$FigmaPaletteCopyWith<$Res>? get primary;$FigmaPaletteCopyWith<$Res>? get secondary;$FigmaPaletteCopyWith<$Res>? get tertiary;$FigmaPaletteCopyWith<$Res>? get neutral;$FigmaPaletteCopyWith<$Res>? get neutralVariant;$FigmaPaletteCopyWith<$Res>? get error;

}
/// @nodoc
class _$FigmaPalettesCopyWithImpl<$Res>
    implements $FigmaPalettesCopyWith<$Res> {
  _$FigmaPalettesCopyWithImpl(this._self, this._then);

  final FigmaPalettes _self;
  final $Res Function(FigmaPalettes) _then;

/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primary = freezed,Object? secondary = freezed,Object? tertiary = freezed,Object? neutral = freezed,Object? neutralVariant = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
primary: freezed == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as FigmaPalette?,secondary: freezed == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as FigmaPalette?,tertiary: freezed == tertiary ? _self.tertiary : tertiary // ignore: cast_nullable_to_non_nullable
as FigmaPalette?,neutral: freezed == neutral ? _self.neutral : neutral // ignore: cast_nullable_to_non_nullable
as FigmaPalette?,neutralVariant: freezed == neutralVariant ? _self.neutralVariant : neutralVariant // ignore: cast_nullable_to_non_nullable
as FigmaPalette?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as FigmaPalette?,
  ));
}
/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaPaletteCopyWith<$Res>? get primary {
    if (_self.primary == null) {
    return null;
  }

  return $FigmaPaletteCopyWith<$Res>(_self.primary!, (value) {
    return _then(_self.copyWith(primary: value));
  });
}/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaPaletteCopyWith<$Res>? get secondary {
    if (_self.secondary == null) {
    return null;
  }

  return $FigmaPaletteCopyWith<$Res>(_self.secondary!, (value) {
    return _then(_self.copyWith(secondary: value));
  });
}/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaPaletteCopyWith<$Res>? get tertiary {
    if (_self.tertiary == null) {
    return null;
  }

  return $FigmaPaletteCopyWith<$Res>(_self.tertiary!, (value) {
    return _then(_self.copyWith(tertiary: value));
  });
}/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaPaletteCopyWith<$Res>? get neutral {
    if (_self.neutral == null) {
    return null;
  }

  return $FigmaPaletteCopyWith<$Res>(_self.neutral!, (value) {
    return _then(_self.copyWith(neutral: value));
  });
}/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaPaletteCopyWith<$Res>? get neutralVariant {
    if (_self.neutralVariant == null) {
    return null;
  }

  return $FigmaPaletteCopyWith<$Res>(_self.neutralVariant!, (value) {
    return _then(_self.copyWith(neutralVariant: value));
  });
}/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaPaletteCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $FigmaPaletteCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.kebab)
class _FigmaPalettes implements FigmaPalettes {
  const _FigmaPalettes({@JsonKey(includeIfNull: false) this.primary, @JsonKey(includeIfNull: false) this.secondary, @JsonKey(includeIfNull: false) this.tertiary, @JsonKey(includeIfNull: false) this.neutral, @JsonKey(includeIfNull: false) this.neutralVariant, @JsonKey(includeIfNull: false) this.error});
  factory _FigmaPalettes.fromJson(Map<String, dynamic> json) => _$FigmaPalettesFromJson(json);

@override@JsonKey(includeIfNull: false) final  FigmaPalette? primary;
@override@JsonKey(includeIfNull: false) final  FigmaPalette? secondary;
@override@JsonKey(includeIfNull: false) final  FigmaPalette? tertiary;
@override@JsonKey(includeIfNull: false) final  FigmaPalette? neutral;
@override@JsonKey(includeIfNull: false) final  FigmaPalette? neutralVariant;
@override@JsonKey(includeIfNull: false) final  FigmaPalette? error;

/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FigmaPalettesCopyWith<_FigmaPalettes> get copyWith => __$FigmaPalettesCopyWithImpl<_FigmaPalettes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FigmaPalettesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FigmaPalettes&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary)&&(identical(other.tertiary, tertiary) || other.tertiary == tertiary)&&(identical(other.neutral, neutral) || other.neutral == neutral)&&(identical(other.neutralVariant, neutralVariant) || other.neutralVariant == neutralVariant)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primary,secondary,tertiary,neutral,neutralVariant,error);

@override
String toString() {
  return 'FigmaPalettes(primary: $primary, secondary: $secondary, tertiary: $tertiary, neutral: $neutral, neutralVariant: $neutralVariant, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FigmaPalettesCopyWith<$Res> implements $FigmaPalettesCopyWith<$Res> {
  factory _$FigmaPalettesCopyWith(_FigmaPalettes value, $Res Function(_FigmaPalettes) _then) = __$FigmaPalettesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) FigmaPalette? primary,@JsonKey(includeIfNull: false) FigmaPalette? secondary,@JsonKey(includeIfNull: false) FigmaPalette? tertiary,@JsonKey(includeIfNull: false) FigmaPalette? neutral,@JsonKey(includeIfNull: false) FigmaPalette? neutralVariant,@JsonKey(includeIfNull: false) FigmaPalette? error
});


@override $FigmaPaletteCopyWith<$Res>? get primary;@override $FigmaPaletteCopyWith<$Res>? get secondary;@override $FigmaPaletteCopyWith<$Res>? get tertiary;@override $FigmaPaletteCopyWith<$Res>? get neutral;@override $FigmaPaletteCopyWith<$Res>? get neutralVariant;@override $FigmaPaletteCopyWith<$Res>? get error;

}
/// @nodoc
class __$FigmaPalettesCopyWithImpl<$Res>
    implements _$FigmaPalettesCopyWith<$Res> {
  __$FigmaPalettesCopyWithImpl(this._self, this._then);

  final _FigmaPalettes _self;
  final $Res Function(_FigmaPalettes) _then;

/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primary = freezed,Object? secondary = freezed,Object? tertiary = freezed,Object? neutral = freezed,Object? neutralVariant = freezed,Object? error = freezed,}) {
  return _then(_FigmaPalettes(
primary: freezed == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as FigmaPalette?,secondary: freezed == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as FigmaPalette?,tertiary: freezed == tertiary ? _self.tertiary : tertiary // ignore: cast_nullable_to_non_nullable
as FigmaPalette?,neutral: freezed == neutral ? _self.neutral : neutral // ignore: cast_nullable_to_non_nullable
as FigmaPalette?,neutralVariant: freezed == neutralVariant ? _self.neutralVariant : neutralVariant // ignore: cast_nullable_to_non_nullable
as FigmaPalette?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as FigmaPalette?,
  ));
}

/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaPaletteCopyWith<$Res>? get primary {
    if (_self.primary == null) {
    return null;
  }

  return $FigmaPaletteCopyWith<$Res>(_self.primary!, (value) {
    return _then(_self.copyWith(primary: value));
  });
}/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaPaletteCopyWith<$Res>? get secondary {
    if (_self.secondary == null) {
    return null;
  }

  return $FigmaPaletteCopyWith<$Res>(_self.secondary!, (value) {
    return _then(_self.copyWith(secondary: value));
  });
}/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaPaletteCopyWith<$Res>? get tertiary {
    if (_self.tertiary == null) {
    return null;
  }

  return $FigmaPaletteCopyWith<$Res>(_self.tertiary!, (value) {
    return _then(_self.copyWith(tertiary: value));
  });
}/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaPaletteCopyWith<$Res>? get neutral {
    if (_self.neutral == null) {
    return null;
  }

  return $FigmaPaletteCopyWith<$Res>(_self.neutral!, (value) {
    return _then(_self.copyWith(neutral: value));
  });
}/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaPaletteCopyWith<$Res>? get neutralVariant {
    if (_self.neutralVariant == null) {
    return null;
  }

  return $FigmaPaletteCopyWith<$Res>(_self.neutralVariant!, (value) {
    return _then(_self.copyWith(neutralVariant: value));
  });
}/// Create a copy of FigmaPalettes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FigmaPaletteCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $FigmaPaletteCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// @nodoc
mixin _$FigmaPalette {

@JsonKey(name: "0")@ColorConverter() Color get t0;@JsonKey(name: "5")@ColorConverter() Color get t5;@JsonKey(name: "10")@ColorConverter() Color get t10;@JsonKey(name: "15")@ColorConverter() Color get t15;@JsonKey(name: "20")@ColorConverter() Color get t20;@JsonKey(name: "25")@ColorConverter() Color get t25;@JsonKey(name: "30")@ColorConverter() Color get t30;@JsonKey(name: "35")@ColorConverter() Color get t35;@JsonKey(name: "40")@ColorConverter() Color get t40;@JsonKey(name: "50")@ColorConverter() Color get t50;@JsonKey(name: "60")@ColorConverter() Color get t60;@JsonKey(name: "70")@ColorConverter() Color get t70;@JsonKey(name: "80")@ColorConverter() Color get t80;@JsonKey(name: "90")@ColorConverter() Color get t90;@JsonKey(name: "95")@ColorConverter() Color get t95;@JsonKey(name: "98")@ColorConverter() Color get t98;@JsonKey(name: "99")@ColorConverter() Color get t99;@JsonKey(name: "100")@ColorConverter() Color get t100;
/// Create a copy of FigmaPalette
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FigmaPaletteCopyWith<FigmaPalette> get copyWith => _$FigmaPaletteCopyWithImpl<FigmaPalette>(this as FigmaPalette, _$identity);

  /// Serializes this FigmaPalette to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FigmaPalette&&(identical(other.t0, t0) || other.t0 == t0)&&(identical(other.t5, t5) || other.t5 == t5)&&(identical(other.t10, t10) || other.t10 == t10)&&(identical(other.t15, t15) || other.t15 == t15)&&(identical(other.t20, t20) || other.t20 == t20)&&(identical(other.t25, t25) || other.t25 == t25)&&(identical(other.t30, t30) || other.t30 == t30)&&(identical(other.t35, t35) || other.t35 == t35)&&(identical(other.t40, t40) || other.t40 == t40)&&(identical(other.t50, t50) || other.t50 == t50)&&(identical(other.t60, t60) || other.t60 == t60)&&(identical(other.t70, t70) || other.t70 == t70)&&(identical(other.t80, t80) || other.t80 == t80)&&(identical(other.t90, t90) || other.t90 == t90)&&(identical(other.t95, t95) || other.t95 == t95)&&(identical(other.t98, t98) || other.t98 == t98)&&(identical(other.t99, t99) || other.t99 == t99)&&(identical(other.t100, t100) || other.t100 == t100));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,t0,t5,t10,t15,t20,t25,t30,t35,t40,t50,t60,t70,t80,t90,t95,t98,t99,t100);

@override
String toString() {
  return 'FigmaPalette(t0: $t0, t5: $t5, t10: $t10, t15: $t15, t20: $t20, t25: $t25, t30: $t30, t35: $t35, t40: $t40, t50: $t50, t60: $t60, t70: $t70, t80: $t80, t90: $t90, t95: $t95, t98: $t98, t99: $t99, t100: $t100)';
}


}

/// @nodoc
abstract mixin class $FigmaPaletteCopyWith<$Res>  {
  factory $FigmaPaletteCopyWith(FigmaPalette value, $Res Function(FigmaPalette) _then) = _$FigmaPaletteCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "0")@ColorConverter() Color t0,@JsonKey(name: "5")@ColorConverter() Color t5,@JsonKey(name: "10")@ColorConverter() Color t10,@JsonKey(name: "15")@ColorConverter() Color t15,@JsonKey(name: "20")@ColorConverter() Color t20,@JsonKey(name: "25")@ColorConverter() Color t25,@JsonKey(name: "30")@ColorConverter() Color t30,@JsonKey(name: "35")@ColorConverter() Color t35,@JsonKey(name: "40")@ColorConverter() Color t40,@JsonKey(name: "50")@ColorConverter() Color t50,@JsonKey(name: "60")@ColorConverter() Color t60,@JsonKey(name: "70")@ColorConverter() Color t70,@JsonKey(name: "80")@ColorConverter() Color t80,@JsonKey(name: "90")@ColorConverter() Color t90,@JsonKey(name: "95")@ColorConverter() Color t95,@JsonKey(name: "98")@ColorConverter() Color t98,@JsonKey(name: "99")@ColorConverter() Color t99,@JsonKey(name: "100")@ColorConverter() Color t100
});




}
/// @nodoc
class _$FigmaPaletteCopyWithImpl<$Res>
    implements $FigmaPaletteCopyWith<$Res> {
  _$FigmaPaletteCopyWithImpl(this._self, this._then);

  final FigmaPalette _self;
  final $Res Function(FigmaPalette) _then;

/// Create a copy of FigmaPalette
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? t0 = null,Object? t5 = null,Object? t10 = null,Object? t15 = null,Object? t20 = null,Object? t25 = null,Object? t30 = null,Object? t35 = null,Object? t40 = null,Object? t50 = null,Object? t60 = null,Object? t70 = null,Object? t80 = null,Object? t90 = null,Object? t95 = null,Object? t98 = null,Object? t99 = null,Object? t100 = null,}) {
  return _then(_self.copyWith(
t0: null == t0 ? _self.t0 : t0 // ignore: cast_nullable_to_non_nullable
as Color,t5: null == t5 ? _self.t5 : t5 // ignore: cast_nullable_to_non_nullable
as Color,t10: null == t10 ? _self.t10 : t10 // ignore: cast_nullable_to_non_nullable
as Color,t15: null == t15 ? _self.t15 : t15 // ignore: cast_nullable_to_non_nullable
as Color,t20: null == t20 ? _self.t20 : t20 // ignore: cast_nullable_to_non_nullable
as Color,t25: null == t25 ? _self.t25 : t25 // ignore: cast_nullable_to_non_nullable
as Color,t30: null == t30 ? _self.t30 : t30 // ignore: cast_nullable_to_non_nullable
as Color,t35: null == t35 ? _self.t35 : t35 // ignore: cast_nullable_to_non_nullable
as Color,t40: null == t40 ? _self.t40 : t40 // ignore: cast_nullable_to_non_nullable
as Color,t50: null == t50 ? _self.t50 : t50 // ignore: cast_nullable_to_non_nullable
as Color,t60: null == t60 ? _self.t60 : t60 // ignore: cast_nullable_to_non_nullable
as Color,t70: null == t70 ? _self.t70 : t70 // ignore: cast_nullable_to_non_nullable
as Color,t80: null == t80 ? _self.t80 : t80 // ignore: cast_nullable_to_non_nullable
as Color,t90: null == t90 ? _self.t90 : t90 // ignore: cast_nullable_to_non_nullable
as Color,t95: null == t95 ? _self.t95 : t95 // ignore: cast_nullable_to_non_nullable
as Color,t98: null == t98 ? _self.t98 : t98 // ignore: cast_nullable_to_non_nullable
as Color,t99: null == t99 ? _self.t99 : t99 // ignore: cast_nullable_to_non_nullable
as Color,t100: null == t100 ? _self.t100 : t100 // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FigmaPalette extends FigmaPalette {
  const _FigmaPalette({@JsonKey(name: "0")@ColorConverter() required this.t0, @JsonKey(name: "5")@ColorConverter() required this.t5, @JsonKey(name: "10")@ColorConverter() required this.t10, @JsonKey(name: "15")@ColorConverter() required this.t15, @JsonKey(name: "20")@ColorConverter() required this.t20, @JsonKey(name: "25")@ColorConverter() required this.t25, @JsonKey(name: "30")@ColorConverter() required this.t30, @JsonKey(name: "35")@ColorConverter() required this.t35, @JsonKey(name: "40")@ColorConverter() required this.t40, @JsonKey(name: "50")@ColorConverter() required this.t50, @JsonKey(name: "60")@ColorConverter() required this.t60, @JsonKey(name: "70")@ColorConverter() required this.t70, @JsonKey(name: "80")@ColorConverter() required this.t80, @JsonKey(name: "90")@ColorConverter() required this.t90, @JsonKey(name: "95")@ColorConverter() required this.t95, @JsonKey(name: "98")@ColorConverter() required this.t98, @JsonKey(name: "99")@ColorConverter() required this.t99, @JsonKey(name: "100")@ColorConverter() required this.t100}): super._();
  factory _FigmaPalette.fromJson(Map<String, dynamic> json) => _$FigmaPaletteFromJson(json);

@override@JsonKey(name: "0")@ColorConverter() final  Color t0;
@override@JsonKey(name: "5")@ColorConverter() final  Color t5;
@override@JsonKey(name: "10")@ColorConverter() final  Color t10;
@override@JsonKey(name: "15")@ColorConverter() final  Color t15;
@override@JsonKey(name: "20")@ColorConverter() final  Color t20;
@override@JsonKey(name: "25")@ColorConverter() final  Color t25;
@override@JsonKey(name: "30")@ColorConverter() final  Color t30;
@override@JsonKey(name: "35")@ColorConverter() final  Color t35;
@override@JsonKey(name: "40")@ColorConverter() final  Color t40;
@override@JsonKey(name: "50")@ColorConverter() final  Color t50;
@override@JsonKey(name: "60")@ColorConverter() final  Color t60;
@override@JsonKey(name: "70")@ColorConverter() final  Color t70;
@override@JsonKey(name: "80")@ColorConverter() final  Color t80;
@override@JsonKey(name: "90")@ColorConverter() final  Color t90;
@override@JsonKey(name: "95")@ColorConverter() final  Color t95;
@override@JsonKey(name: "98")@ColorConverter() final  Color t98;
@override@JsonKey(name: "99")@ColorConverter() final  Color t99;
@override@JsonKey(name: "100")@ColorConverter() final  Color t100;

/// Create a copy of FigmaPalette
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FigmaPaletteCopyWith<_FigmaPalette> get copyWith => __$FigmaPaletteCopyWithImpl<_FigmaPalette>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FigmaPaletteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FigmaPalette&&(identical(other.t0, t0) || other.t0 == t0)&&(identical(other.t5, t5) || other.t5 == t5)&&(identical(other.t10, t10) || other.t10 == t10)&&(identical(other.t15, t15) || other.t15 == t15)&&(identical(other.t20, t20) || other.t20 == t20)&&(identical(other.t25, t25) || other.t25 == t25)&&(identical(other.t30, t30) || other.t30 == t30)&&(identical(other.t35, t35) || other.t35 == t35)&&(identical(other.t40, t40) || other.t40 == t40)&&(identical(other.t50, t50) || other.t50 == t50)&&(identical(other.t60, t60) || other.t60 == t60)&&(identical(other.t70, t70) || other.t70 == t70)&&(identical(other.t80, t80) || other.t80 == t80)&&(identical(other.t90, t90) || other.t90 == t90)&&(identical(other.t95, t95) || other.t95 == t95)&&(identical(other.t98, t98) || other.t98 == t98)&&(identical(other.t99, t99) || other.t99 == t99)&&(identical(other.t100, t100) || other.t100 == t100));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,t0,t5,t10,t15,t20,t25,t30,t35,t40,t50,t60,t70,t80,t90,t95,t98,t99,t100);

@override
String toString() {
  return 'FigmaPalette(t0: $t0, t5: $t5, t10: $t10, t15: $t15, t20: $t20, t25: $t25, t30: $t30, t35: $t35, t40: $t40, t50: $t50, t60: $t60, t70: $t70, t80: $t80, t90: $t90, t95: $t95, t98: $t98, t99: $t99, t100: $t100)';
}


}

/// @nodoc
abstract mixin class _$FigmaPaletteCopyWith<$Res> implements $FigmaPaletteCopyWith<$Res> {
  factory _$FigmaPaletteCopyWith(_FigmaPalette value, $Res Function(_FigmaPalette) _then) = __$FigmaPaletteCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "0")@ColorConverter() Color t0,@JsonKey(name: "5")@ColorConverter() Color t5,@JsonKey(name: "10")@ColorConverter() Color t10,@JsonKey(name: "15")@ColorConverter() Color t15,@JsonKey(name: "20")@ColorConverter() Color t20,@JsonKey(name: "25")@ColorConverter() Color t25,@JsonKey(name: "30")@ColorConverter() Color t30,@JsonKey(name: "35")@ColorConverter() Color t35,@JsonKey(name: "40")@ColorConverter() Color t40,@JsonKey(name: "50")@ColorConverter() Color t50,@JsonKey(name: "60")@ColorConverter() Color t60,@JsonKey(name: "70")@ColorConverter() Color t70,@JsonKey(name: "80")@ColorConverter() Color t80,@JsonKey(name: "90")@ColorConverter() Color t90,@JsonKey(name: "95")@ColorConverter() Color t95,@JsonKey(name: "98")@ColorConverter() Color t98,@JsonKey(name: "99")@ColorConverter() Color t99,@JsonKey(name: "100")@ColorConverter() Color t100
});




}
/// @nodoc
class __$FigmaPaletteCopyWithImpl<$Res>
    implements _$FigmaPaletteCopyWith<$Res> {
  __$FigmaPaletteCopyWithImpl(this._self, this._then);

  final _FigmaPalette _self;
  final $Res Function(_FigmaPalette) _then;

/// Create a copy of FigmaPalette
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? t0 = null,Object? t5 = null,Object? t10 = null,Object? t15 = null,Object? t20 = null,Object? t25 = null,Object? t30 = null,Object? t35 = null,Object? t40 = null,Object? t50 = null,Object? t60 = null,Object? t70 = null,Object? t80 = null,Object? t90 = null,Object? t95 = null,Object? t98 = null,Object? t99 = null,Object? t100 = null,}) {
  return _then(_FigmaPalette(
t0: null == t0 ? _self.t0 : t0 // ignore: cast_nullable_to_non_nullable
as Color,t5: null == t5 ? _self.t5 : t5 // ignore: cast_nullable_to_non_nullable
as Color,t10: null == t10 ? _self.t10 : t10 // ignore: cast_nullable_to_non_nullable
as Color,t15: null == t15 ? _self.t15 : t15 // ignore: cast_nullable_to_non_nullable
as Color,t20: null == t20 ? _self.t20 : t20 // ignore: cast_nullable_to_non_nullable
as Color,t25: null == t25 ? _self.t25 : t25 // ignore: cast_nullable_to_non_nullable
as Color,t30: null == t30 ? _self.t30 : t30 // ignore: cast_nullable_to_non_nullable
as Color,t35: null == t35 ? _self.t35 : t35 // ignore: cast_nullable_to_non_nullable
as Color,t40: null == t40 ? _self.t40 : t40 // ignore: cast_nullable_to_non_nullable
as Color,t50: null == t50 ? _self.t50 : t50 // ignore: cast_nullable_to_non_nullable
as Color,t60: null == t60 ? _self.t60 : t60 // ignore: cast_nullable_to_non_nullable
as Color,t70: null == t70 ? _self.t70 : t70 // ignore: cast_nullable_to_non_nullable
as Color,t80: null == t80 ? _self.t80 : t80 // ignore: cast_nullable_to_non_nullable
as Color,t90: null == t90 ? _self.t90 : t90 // ignore: cast_nullable_to_non_nullable
as Color,t95: null == t95 ? _self.t95 : t95 // ignore: cast_nullable_to_non_nullable
as Color,t98: null == t98 ? _self.t98 : t98 // ignore: cast_nullable_to_non_nullable
as Color,t99: null == t99 ? _self.t99 : t99 // ignore: cast_nullable_to_non_nullable
as Color,t100: null == t100 ? _self.t100 : t100 // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}


/// @nodoc
mixin _$Template {

@JsonKey(includeIfNull: false)@ColorConverter() Color? get sourceColor;@JsonKey(includeIfNull: false)@ColorConverter() Color? get primaryPaletteKeyColor;@JsonKey(includeIfNull: false)@ColorConverter() Color? get secondaryPaletteKeyColor;@JsonKey(includeIfNull: false)@ColorConverter() Color? get tertiaryPaletteKeyColor;@JsonKey(includeIfNull: false)@ColorConverter() Color? get neutralPaletteKeyColor;@JsonKey(includeIfNull: false)@ColorConverter() Color? get neutralVariantPaletteKeyColor;@JsonKey(includeIfNull: false)@ColorConverter() Color? get errorPaletteKeyColor;
/// Create a copy of Template
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemplateCopyWith<Template> get copyWith => _$TemplateCopyWithImpl<Template>(this as Template, _$identity);

  /// Serializes this Template to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Template&&(identical(other.sourceColor, sourceColor) || other.sourceColor == sourceColor)&&(identical(other.primaryPaletteKeyColor, primaryPaletteKeyColor) || other.primaryPaletteKeyColor == primaryPaletteKeyColor)&&(identical(other.secondaryPaletteKeyColor, secondaryPaletteKeyColor) || other.secondaryPaletteKeyColor == secondaryPaletteKeyColor)&&(identical(other.tertiaryPaletteKeyColor, tertiaryPaletteKeyColor) || other.tertiaryPaletteKeyColor == tertiaryPaletteKeyColor)&&(identical(other.neutralPaletteKeyColor, neutralPaletteKeyColor) || other.neutralPaletteKeyColor == neutralPaletteKeyColor)&&(identical(other.neutralVariantPaletteKeyColor, neutralVariantPaletteKeyColor) || other.neutralVariantPaletteKeyColor == neutralVariantPaletteKeyColor)&&(identical(other.errorPaletteKeyColor, errorPaletteKeyColor) || other.errorPaletteKeyColor == errorPaletteKeyColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceColor,primaryPaletteKeyColor,secondaryPaletteKeyColor,tertiaryPaletteKeyColor,neutralPaletteKeyColor,neutralVariantPaletteKeyColor,errorPaletteKeyColor);

@override
String toString() {
  return 'Template(sourceColor: $sourceColor, primaryPaletteKeyColor: $primaryPaletteKeyColor, secondaryPaletteKeyColor: $secondaryPaletteKeyColor, tertiaryPaletteKeyColor: $tertiaryPaletteKeyColor, neutralPaletteKeyColor: $neutralPaletteKeyColor, neutralVariantPaletteKeyColor: $neutralVariantPaletteKeyColor, errorPaletteKeyColor: $errorPaletteKeyColor)';
}


}

/// @nodoc
abstract mixin class $TemplateCopyWith<$Res>  {
  factory $TemplateCopyWith(Template value, $Res Function(Template) _then) = _$TemplateCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false)@ColorConverter() Color? sourceColor,@JsonKey(includeIfNull: false)@ColorConverter() Color? primaryPaletteKeyColor,@JsonKey(includeIfNull: false)@ColorConverter() Color? secondaryPaletteKeyColor,@JsonKey(includeIfNull: false)@ColorConverter() Color? tertiaryPaletteKeyColor,@JsonKey(includeIfNull: false)@ColorConverter() Color? neutralPaletteKeyColor,@JsonKey(includeIfNull: false)@ColorConverter() Color? neutralVariantPaletteKeyColor,@JsonKey(includeIfNull: false)@ColorConverter() Color? errorPaletteKeyColor
});




}
/// @nodoc
class _$TemplateCopyWithImpl<$Res>
    implements $TemplateCopyWith<$Res> {
  _$TemplateCopyWithImpl(this._self, this._then);

  final Template _self;
  final $Res Function(Template) _then;

/// Create a copy of Template
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceColor = freezed,Object? primaryPaletteKeyColor = freezed,Object? secondaryPaletteKeyColor = freezed,Object? tertiaryPaletteKeyColor = freezed,Object? neutralPaletteKeyColor = freezed,Object? neutralVariantPaletteKeyColor = freezed,Object? errorPaletteKeyColor = freezed,}) {
  return _then(_self.copyWith(
sourceColor: freezed == sourceColor ? _self.sourceColor : sourceColor // ignore: cast_nullable_to_non_nullable
as Color?,primaryPaletteKeyColor: freezed == primaryPaletteKeyColor ? _self.primaryPaletteKeyColor : primaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
as Color?,secondaryPaletteKeyColor: freezed == secondaryPaletteKeyColor ? _self.secondaryPaletteKeyColor : secondaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
as Color?,tertiaryPaletteKeyColor: freezed == tertiaryPaletteKeyColor ? _self.tertiaryPaletteKeyColor : tertiaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
as Color?,neutralPaletteKeyColor: freezed == neutralPaletteKeyColor ? _self.neutralPaletteKeyColor : neutralPaletteKeyColor // ignore: cast_nullable_to_non_nullable
as Color?,neutralVariantPaletteKeyColor: freezed == neutralVariantPaletteKeyColor ? _self.neutralVariantPaletteKeyColor : neutralVariantPaletteKeyColor // ignore: cast_nullable_to_non_nullable
as Color?,errorPaletteKeyColor: freezed == errorPaletteKeyColor ? _self.errorPaletteKeyColor : errorPaletteKeyColor // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Template implements Template {
  const _Template({@JsonKey(includeIfNull: false)@ColorConverter() this.sourceColor, @JsonKey(includeIfNull: false)@ColorConverter() this.primaryPaletteKeyColor, @JsonKey(includeIfNull: false)@ColorConverter() this.secondaryPaletteKeyColor, @JsonKey(includeIfNull: false)@ColorConverter() this.tertiaryPaletteKeyColor, @JsonKey(includeIfNull: false)@ColorConverter() this.neutralPaletteKeyColor, @JsonKey(includeIfNull: false)@ColorConverter() this.neutralVariantPaletteKeyColor, @JsonKey(includeIfNull: false)@ColorConverter() this.errorPaletteKeyColor});
  factory _Template.fromJson(Map<String, dynamic> json) => _$TemplateFromJson(json);

@override@JsonKey(includeIfNull: false)@ColorConverter() final  Color? sourceColor;
@override@JsonKey(includeIfNull: false)@ColorConverter() final  Color? primaryPaletteKeyColor;
@override@JsonKey(includeIfNull: false)@ColorConverter() final  Color? secondaryPaletteKeyColor;
@override@JsonKey(includeIfNull: false)@ColorConverter() final  Color? tertiaryPaletteKeyColor;
@override@JsonKey(includeIfNull: false)@ColorConverter() final  Color? neutralPaletteKeyColor;
@override@JsonKey(includeIfNull: false)@ColorConverter() final  Color? neutralVariantPaletteKeyColor;
@override@JsonKey(includeIfNull: false)@ColorConverter() final  Color? errorPaletteKeyColor;

/// Create a copy of Template
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TemplateCopyWith<_Template> get copyWith => __$TemplateCopyWithImpl<_Template>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TemplateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Template&&(identical(other.sourceColor, sourceColor) || other.sourceColor == sourceColor)&&(identical(other.primaryPaletteKeyColor, primaryPaletteKeyColor) || other.primaryPaletteKeyColor == primaryPaletteKeyColor)&&(identical(other.secondaryPaletteKeyColor, secondaryPaletteKeyColor) || other.secondaryPaletteKeyColor == secondaryPaletteKeyColor)&&(identical(other.tertiaryPaletteKeyColor, tertiaryPaletteKeyColor) || other.tertiaryPaletteKeyColor == tertiaryPaletteKeyColor)&&(identical(other.neutralPaletteKeyColor, neutralPaletteKeyColor) || other.neutralPaletteKeyColor == neutralPaletteKeyColor)&&(identical(other.neutralVariantPaletteKeyColor, neutralVariantPaletteKeyColor) || other.neutralVariantPaletteKeyColor == neutralVariantPaletteKeyColor)&&(identical(other.errorPaletteKeyColor, errorPaletteKeyColor) || other.errorPaletteKeyColor == errorPaletteKeyColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceColor,primaryPaletteKeyColor,secondaryPaletteKeyColor,tertiaryPaletteKeyColor,neutralPaletteKeyColor,neutralVariantPaletteKeyColor,errorPaletteKeyColor);

@override
String toString() {
  return 'Template(sourceColor: $sourceColor, primaryPaletteKeyColor: $primaryPaletteKeyColor, secondaryPaletteKeyColor: $secondaryPaletteKeyColor, tertiaryPaletteKeyColor: $tertiaryPaletteKeyColor, neutralPaletteKeyColor: $neutralPaletteKeyColor, neutralVariantPaletteKeyColor: $neutralVariantPaletteKeyColor, errorPaletteKeyColor: $errorPaletteKeyColor)';
}


}

/// @nodoc
abstract mixin class _$TemplateCopyWith<$Res> implements $TemplateCopyWith<$Res> {
  factory _$TemplateCopyWith(_Template value, $Res Function(_Template) _then) = __$TemplateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false)@ColorConverter() Color? sourceColor,@JsonKey(includeIfNull: false)@ColorConverter() Color? primaryPaletteKeyColor,@JsonKey(includeIfNull: false)@ColorConverter() Color? secondaryPaletteKeyColor,@JsonKey(includeIfNull: false)@ColorConverter() Color? tertiaryPaletteKeyColor,@JsonKey(includeIfNull: false)@ColorConverter() Color? neutralPaletteKeyColor,@JsonKey(includeIfNull: false)@ColorConverter() Color? neutralVariantPaletteKeyColor,@JsonKey(includeIfNull: false)@ColorConverter() Color? errorPaletteKeyColor
});




}
/// @nodoc
class __$TemplateCopyWithImpl<$Res>
    implements _$TemplateCopyWith<$Res> {
  __$TemplateCopyWithImpl(this._self, this._then);

  final _Template _self;
  final $Res Function(_Template) _then;

/// Create a copy of Template
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceColor = freezed,Object? primaryPaletteKeyColor = freezed,Object? secondaryPaletteKeyColor = freezed,Object? tertiaryPaletteKeyColor = freezed,Object? neutralPaletteKeyColor = freezed,Object? neutralVariantPaletteKeyColor = freezed,Object? errorPaletteKeyColor = freezed,}) {
  return _then(_Template(
sourceColor: freezed == sourceColor ? _self.sourceColor : sourceColor // ignore: cast_nullable_to_non_nullable
as Color?,primaryPaletteKeyColor: freezed == primaryPaletteKeyColor ? _self.primaryPaletteKeyColor : primaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
as Color?,secondaryPaletteKeyColor: freezed == secondaryPaletteKeyColor ? _self.secondaryPaletteKeyColor : secondaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
as Color?,tertiaryPaletteKeyColor: freezed == tertiaryPaletteKeyColor ? _self.tertiaryPaletteKeyColor : tertiaryPaletteKeyColor // ignore: cast_nullable_to_non_nullable
as Color?,neutralPaletteKeyColor: freezed == neutralPaletteKeyColor ? _self.neutralPaletteKeyColor : neutralPaletteKeyColor // ignore: cast_nullable_to_non_nullable
as Color?,neutralVariantPaletteKeyColor: freezed == neutralVariantPaletteKeyColor ? _self.neutralVariantPaletteKeyColor : neutralVariantPaletteKeyColor // ignore: cast_nullable_to_non_nullable
as Color?,errorPaletteKeyColor: freezed == errorPaletteKeyColor ? _self.errorPaletteKeyColor : errorPaletteKeyColor // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}


}

// dart format on
