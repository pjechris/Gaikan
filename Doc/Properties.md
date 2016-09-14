# Style properties

## Background
- __**since**__: 0.3
- __**description**__: Sets a background to your view (color, gradient and or image)
- __**applies**__: `UIView`
- __**usage**__:

  ```swift
    style.background = UIColor.redColor()
    style.background = Background(UIImage(named: "bg"), UIColor.orangeGradient())
```

## Border
- __**since**__: 0.1
- __**description**__: Sets view border color and width
- __**applies**__: `UIView`
- __**usage**__:

  ```swift
    style.border = Border(width: 1, color: UIColor.blueColor())
    ```

## Clip
- __**since**__: 0.4
- __**description**__: enables/disables view overflow clipping
- __**applies**__: `UIView`
- __**default**__: false
- __**usage**__:

 ```swift
   style.clip = true
   ```

## Color

- __**since**__: 0.1
- __**description**__: Sets text color
- __**applies**__: `UILabel`
- __**usage**__:

 ```swift
   style.color = UIColor.redColor()
   ```

## CornerRadius

- __**since**__: 0.4
- __**description**__: Sets view corner radius
- __**applies**__: `UIView`
- __**usage**__:

 ```swift
   style.corners = Corners(radius: 4)
   ```

## Font

- __**since**__: 0.1
- __**description**__: Sets text font
- __**applies**__: `UILabel`
- __**usage**__:

 ```swift
   style.font = UIFont.systemFontOfSize(15)
   ```

## Height

- __**since**__: 0.7
- __**description**__: Sets a view height using AutoLayout.
- __**applies**__: `UIView`
- __**usage**__:

 ```swift
  style.height = 42
  style.height = 50 ~ UILayoutPriorityDefaultHigh
 ```

## Margin

- __**since**__: 0.6
- __**description**__: Sets a view internal margin/padding, i.e. `UIView.layoutMargins` or `UIButton.contentEdgeInsets`.
- __**applies**__: `UIView`, `UIButton`
- __**usage**__:

 ```swift
   style.margin = UIEdgeInsetsMake(4, 4, 2, 2)
   /// sets UIView.layoutMargins
   /// or UIButton.contentEdgeInsets
   ```

## MaxHeight

- __**since**__: 0.7
- __**description**__: Sets a view maximum height using AutoLayout.
- __**applies**__: `UIView`
- __**usage**__:

 ```swift
  style.maxHeight = 42
  style.maxHeight = 50 ~ UILayoutPriorityDefaultHigh
 ```

## MaxWidth

- __**since**__: 0.7
- __**description**__: Sets a view maximum width using AutoLayout.
- __**applies**__: `UIView`
- __**see**__: maxHeight

## MinHeight

- __**since**__: 0.7
- __**description**__: Sets a view minimum height using AutoLayout.
- __**applies**__: `UIView`
- __**usage**__:

 ```swift
  style.minHeight = 42
  style.minHeight = 50 ~ UILayoutPriorityDefaultHigh
 ```

## MinWidth

- __**since**__: 0.7
- __**description**__: Sets a view minimum width using AutoLayout.
- __**applies**__: `UIView`
- __**see**__: minHeight

## Opacity

- __**since**__: 0.4
- __**description**__: Changes view alpha.
- __**applies**__: `UIView`
- __**range**__: 0 (tranparent) ... 100 (opaque)
- __**usage**__:

 ```swift
   style.opacity = 80
   ```

## TextAlign

## TextOverflow

## TintColor

## Transform

## Visible

- __**since**__: 0.1
- __**description**__: Sets whether or not the view is visible by changing `hidden` property.
- __**applies**__: `UIView`
- __**default**__: true
- __**usage**__:

 ```swift
   style.visible = false
   ```

## Width

- __**since**__: 0.7
- __**description**__: Sets a view width using AutoLayout.
- __**applies**__: `UIView`
- __**see**__: height 
