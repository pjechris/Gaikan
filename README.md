<h1><img src="Doc/Screen/logo.png" width="550" alt="Gaikan" /></h1>
[![Build Status](https://travis-ci.org/akane/Gaikan.svg?branch=travis)](https://travis-ci.org/akane/Gaikan)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Gaikan.svg)](https://img.shields.io/cocoapods/v/Gaikan.svg)


Gaikan gives you powerful styling capabilities using a declarative DSL in Swift.
_Inspired by_ <a href="https://speakerdeck.com/vjeux/react-css-in-js">React: CSS in JS</a> and <a href="http://glenmaddern.com/articles/css-modules">CSS modules</a>.

To style UIView(s) just give them a ```Style``` object:

```Swift

let myLabelStyle: Style = [
  .Color: UIColor.redColor(),
  .Border: Border(width: 1, color: UIColor.greenColor()),
  .Font: UIFont(name: "Courier", size: 24),        
]
/// OR
let myLabelStyle = StyleRule() { (inout style: StyleRule) -> () in
  style.color = UIColor.redColor()
  style.border = Border(width: 1, color: UIColor.greenColor())
  style.font = UIFont(name: "Courier", size: 24)
}

self.label.applyStyle(myLabelStyle)

```

Check out the sample to see how to integrate Gaikan into a project.

<img src="Doc/Screen/gaikan.png" width="400" />

## Features

* Apply a simple ```Style``` struct style to your views...
* ... or use ```styleName``` to apply a style from a style list
* You can reuse styles using ```extends``` method
* You can style depending on your control state (enabled, highlighted, ...)

## Properties

Depending on your view type (UILabel, UIScrollView, UITextField, ...) some properties may or
may not have any effect. Here are all the available style properties you can use:

| Property name | Apply to  | Description                     | Available version
| --------------|-----------|---------------------------------|------------------
| Background    | UIView    | Sets a background to your view (color, gradient and or image)  | 0.3
| Border        | UIView    | Sets the layer Border           | 0.1
| Color         | UILabel   | Sets the text color             | 0.1
| Font          | UILabel   | Sets the text font              | 0.1
| TextAlign     | UILabel   | Text horizontal alignment       | 0.2
| TintColor     | UIView    | Sets the tint color             | 0.1
| Visible       | UIView    | Sets the view hidden property   | 0.1

## Installing

Gaikan can be installed either using [CocoaPods](https://cocoapods.org/) or [Carthage](https://github.com/Carthage/Carthage).

### CocoaPods

Run the following command from your project folder:

```ruby
pod install Gaikan
```

### Carthage

Add the following line to your Cartfile:

```
github "akane/Gaikan"
```

## Advanced usage

### Theme

Manually defining a ```Style``` object for each view is cumbersome.
Most of the time what you'll really want to do is defining a ```Theme```: a
```Theme``` packages together multiple ```Style``` definitions for a ```Themable``` view.

```Swift
class CustomView: UIView, Themable {
  typealias ThemeType = RailTheme

  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var footnote: UILabel!
  @IBOutlet weak var logo: UIImageView!
  @IBOutlet weak var button: UIButton!

  func stylableThemeItems() -> [Stylable] {
    return [self, self.title, self.footnote, self.logo, self.button]
  }

  override func awakeFromNib() {
    self.title.styleName = "title"
    self.logo.styleName = "home-logo"
  }
}

public class RailTheme : Theme {
    public func styles() -> [String : Style] {
        return [
            "home-logo": Style(...),
            "title": Style(...)
        ]
    }
}

```

### Extends

You can extend your styles to reuse common features

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

func merged() ->  {
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
  .include(.Selected, attributes: [
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
