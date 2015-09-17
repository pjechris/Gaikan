[![Build Status](https://travis-ci.org/akane/Gaikan.svg?branch=travis)](https://travis-ci.org/akane/Gaikan)
# Gaikan

```ruby
pod install Gaikan
```

Gaikan is a tool to style your views easily outside of your classes. It gives you powerful styling capabilities without CSS.

_Inspired by_ <a href="https://speakerdeck.com/vjeux/react-css-in-js">React: CSS in JS</a> and <a href="http://glenmaddern.com/articles/css-modules">CSS modules</a>

![gaikan](Doc/Screen/gaikan.jpg)

## Features

* Apply a simple ```StyleRule``` struct style to your views...
* ... or use ```styleName``` to apply a style from a style list
* You can reuse styles using ```extends``` method

## Usage

Just ```import Gaikan``` into your code and start creating a ```StyleRule``` struct :

```Swift

let myLabelStyle: StyleRule = [
  .Color: UIColor.redColor(),
  .Border: Border(width: 1, color: UIColor.greenColor()),
  .Font: UIFont(name: "Courier", size: 24),        
]

self.label.applyStyle(myLabelStyle)

```

and... voila!

## Properties

Depending on your view type (UILabel, UIScrollView, UITextField, ...) some properties may or
may not have any effect. Here are all the available style properties you can use:

| Property name | Apply to  | Description                     | Available version
| --------------|-----------|---------------------------------|------------------
| Color         | UILabel   | Sets the text color             | 0.1
| Border        | UIView    | Sets the layer Border           | 0.1
| Font          | UILabel   | Sets the text font              | 0.1
| TintColor     | UIView    | Sets the tint color             | 0.1
| Visible       | UIView    | Sets the view hidden property   | 0.1

## License

Gaikan is released under the MIT License. Please see the LICENSE file for details.
