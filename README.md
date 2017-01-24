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
pod "AutomaticStatusBarColor"
```

## Usage
### First step
Add the following line to your info.plist : *View controller-based status bar appearance*, and select the value *NO*

###Basic usage
You just have one line to add to your app delegate method  `application: didFinishLaunchingWithOptions`

```swift
AutomaticStatusBarColor.sharedInstance.isEnabled = true
```

You can control Automatic status bar by accessing methods thru the singleton `AutomaticStatusBarColor.sharedInstance`

###Disable for one controller
Just hit the method *disable*

```swift
AutomaticStatusBarColor.sharedInstance.disable(forViewController: self)
```

###Choose manually status bar color

You can choose status bar color for one controller if you don't like the result or wanna keep the hand over it.

```swift
AutomaticStatusBarColor.sharedInstance.force(statusBarStyle: .lightContent, forViewController: self)
```

## TODO

Control component thru an UIViewController extension.
Adding the possibility to refresh manually

## Author

Victor Carmouze, victor.carmouze@gmail.com

## License

AutomaticStatusBarColor is available under the MIT license. See the LICENSE file for more info.
