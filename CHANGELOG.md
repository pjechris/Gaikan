# CHANGELOG

# 0.8.0

## Added

- Swift 3 support!

# 0.7.0

## Added

- Added height, minHeight, maxHeight
- Added width, minWidth, maxWidth

## Enhancements

- Migrated to Swift 2.3

# 0.6.0

## Added

- Added Carthage support. By [siemensikkema](https://github.com/siemensikkema) [#PR-7](https://github.com/akane/Gaikan/pull/7)
- [Style] Added `textAttributes` on `StyleRule` which converts a style into `NSAttributedString` style attributes.
- [Style] Added `margin` attribute.
- [Style] Added `textOverflow` attribute.

## Enhancements

## Bugfixes

- [Property] Fixed `clip` attribute not setted correctly.

# 0.5.0

## Added

## Enhancements

- [Theme] Themes are now simple `AnyObject`. You just define (non static) attributes
on it and apply them on a `UIView` usting the new `styleClass` attribute.
- [IB] To apply a style right from InterfaceBuilder, you now define `themeClassName`
in addition to `styleName`.
- [Style] Replaced `applyStyle` with `styleInline`.
While the former was totally replacing the style, the newer appends style to `styleClass`.

## Bugfixes

# 0.4.0

## Added

- [Property] Added `CornerRadius`.
- [Property] Added `Clip`.
- [Property] Added `Opacity`.
- [Property] Added `Transform`.

## Enhancements

## Bugfixes

- [Background] Fixed renderer positions for `Gradient`.
