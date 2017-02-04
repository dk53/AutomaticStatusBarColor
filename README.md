# AutomaticStatusBarColor

[![CI Status](http://img.shields.io/travis/dk53/AutomaticStatusBarColor.svg?style=flat)](https://travis-ci.org/dk53/AutomaticStatusBarColor)
[![Version](https://img.shields.io/cocoapods/v/AutomaticStatusBarColor.svg?style=flat)](http://cocoapods.org/pods/AutomaticStatusBarColor)
[![License](https://img.shields.io/cocoapods/l/AutomaticStatusBarColor.svg?style=flat)](http://cocoapods.org/pods/AutomaticStatusBarColor)
[![Platform](https://img.shields.io/cocoapods/p/AutomaticStatusBarColor.svg?style=flat)](http://cocoapods.org/pods/AutomaticStatusBarColor)

## Description
AutomaticStatusBarColor is a lightweight one line component to manage status bar color automaticly throughout your application 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

AutomaticStatusBarColor is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AutomaticStatusBarColor'
```

## Lastest version

1.0.0

## Usage
### First step
Add the following line to your info.plist : *View controller-based status bar appearance*, and select the value *NO*

###Basic usage

AutomaticStatusBarColor is designed to work thru all your application without a single line of code. 

But, if you want some control, you can access AutomaticStatusBarColor methods configuration thru `UIViewController` extension

###Disable for one controller
Just hit the method *disableAutomaticStatusBarColor*

```swift
disableAutomaticStatusBarColor()
```

###Choose manually status bar color

You can choose status bar color for one controller if you don't like the result or wanna keep the hand over it.

```swift
force(statusBarStyle: .lightContent)
```

###Navigation Bar

If you've planned to use a navigation bar, take care to hide or show it before the `super.viewWillAppear(:)`

## Author

Victor Carmouze, victor.carmouze@gmail.com

## License

AutomaticStatusBarColor is available under the MIT license. See the LICENSE file for more info.
