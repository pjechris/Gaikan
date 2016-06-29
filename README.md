<h1><img src="Doc/Screen/logo.png" width="550" alt="Gaikan" /></h1>

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Gaikan.svg)](https://img.shields.io/cocoapods/v/Gaikan.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/akane/Gaikan.svg?branch=travis)](https://travis-ci.org/akane/Gaikan)

Gaikan gives you powerful styling capabilities using a declarative DSL in Swift.
_Inspired by_ <a href="https://speakerdeck.com/vjeux/react-css-in-js">React: CSS in JS</a> and <a href="http://glenmaddern.com/articles/css-modules">CSS modules</a>.

To style UIView(s) just give them a ```StyleRule``` object:

```Swift

let myLabelStyle = StyleRule() { (inout style: StyleRule) -> () in
  style.color = UIColor.redColor()
  style.border = Border(width: 1, color: UIColor.greenColor())
  style.font = UIFont(name: "Courier", size: 24)
}

self.label.styleInline = myLabelStyle

```

Check out the sample to see how to well integrate Gaikan into a project.

<img src="Doc/Screen/gaikan.png" width="400" />

## Features

* Apply a simple style using ```styleInline```....
* ... or make theming using ```styleClass``` (see below for more information).
* You can share styles using ```extends``` method to avoid repeating yourself.
* You can style depending on your control state (enabled, highlighted, ...).
* You can style `NSAttributedString`!

## Properties

Depending on your view type (UILabel, UIScrollView, UITextField, ...) some properties may or
may not have any effect. Here are all the available style properties you can use:

| Property name | Apply to  | Description                     | Available since
| --------------|-----------|---------------------------------|------------------
| Background    | UIView    | Sets a background to your view (color, gradient and or image)  | 0.3
| Border        | UIView    | Sets the layer Border           | 0.1
| Clip          | UIView    | Make the content of the view hidden if larger than the frame | 0.4
| Color         | UILabel   | Sets the text color             | 0.1
| CornerRadius  | UIView    | Sets the view layer corner radius | 0.4
| Font          | UILabel   | Sets the text font              | 0.1
| Margin        | UIView    | Sets view layoutMargins (or button title inset) | 0.6
| Opacity       | UIView    | Change the view alpha (0...1)   | 0.4
| TextAlign     | UILabel   | Text horizontal alignment       | 0.2
| TintColor     | UIView    | Sets the tint color             | 0.1
| Transform     | UIview    | Apply transforms (rotation, ...)| 0.4
| Visible       | UIView    | Sets the view hidden property   | 0.1

Starting with 0.4, we also added `VirtualView`. This allow you to apply style effects on some non `UIView`
attributes/objects:

| NSObject          | Virtual view  | Description            | Available since
| ------------------|---------------|------------------------|------------------
| UINavigationBar   | titleStyle    | Sets title navigation bar style   | 0.4

## Advanced usage

### NSAttributedString

Just call `NSAttributedString(string:"Hello", style: yourStyle)` to get a  styled `NSAttributedString`.

Alternatively you can use `style.textAttributes` to transform `StyleRule` into any `NSAttributedString` compatible dictionary.

### Theme

```Theme``` packages together multiple ```Style``` definitions to make a whole set.

```Swift

public class SampleTheme : Theme {
  /// Non static is important if you want to reference them from InterfaceBuilder
  lazy let logo = Style(...)
  lazy let title = Style(...)
}

class CustomView: UIView {
  typealias ThemeType = RailTheme

  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var footnote: UILabel!
  @IBOutlet weak var logo: UIImageView!
  @IBOutlet weak var button: UIButton!

  override func awakeFromNib() {
    self.title.styleClass = SampleTheme().logo
    self.logo.styleClass = SampleTheme().title
  }
}

```

You can also apply themes right from InterfaceBuilder:

<img src="Doc/Screen/ib-styleclass.png" width="400" />

### Extends

You can extend your styles to reuse common features:

```Swift
func primary() -> Style {
  return [
    .Color: UIColor.greenColor()
  ]
}

func large() -> Style {
  return [
    .Font: UIFont.systemFontOfSize(18)
  ]
}

func merged() -> Style {
  return Style().extends(primary(), large())
  // color: green, font: 18
}

```

### States

You can define styles for states. They'll extend from the default state :

```Swift
func style() -> Style {
  return [
    .TintColor: UIColor.whiteColor()
  ]
  .state(.Selected, attributes: [
      .TintColor: UIColor.grayColor().colorWithAlphaComponent(0.6)
  ]
}
```

Don't hesitate to take a look at the sample to better understand how it works.

## Contributing

This project was first developed by [Xebia IT Architects](http://xebia.fr) in Paris, France with the ultimate goal of releasing it as Open Source Software.
We will continue working and investing on it.

We encourage the community to contribute to the project by opening tickets and/or pull requests.

## License

Gaikan is released under the MIT License. Please see the LICENSE file for details.
