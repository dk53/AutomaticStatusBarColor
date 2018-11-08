//
//  AppDelegate.swift
//  AutomaticStatusBarColor
//
//  Created by Victor Carmouze on 01/23/2017.
//  Copyright (c) 2017 Victor Carmouze. All rights reserved.
//

public class AutomaticStatusBarColor {

    init() {
        UIViewController.classInit
    }

    public static let sharedInstance = AutomaticStatusBarColor()

    fileprivate var disabledViewControllers = [UIViewController]()
    fileprivate var customStatusBarViewControllers = [(controller: UIViewController, style: UIStatusBarStyle)]()

    fileprivate var isEnabled = true

    public func disable(forViewController viewController: UIViewController) {
        disabledViewControllers.append(viewController)
    }

    public func force(statusBarStyle style: UIStatusBarStyle, forViewController viewController: UIViewController) {
        customStatusBarViewControllers.append((viewController, style))
    }
}

private let swizzling: (AnyClass, Selector, Selector) -> () = { forClass, originalSelector, swizzledSelector in
    guard
        let originalMethod = class_getInstanceMethod(forClass, originalSelector),
        let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
        else { return }
    method_exchangeImplementations(originalMethod, swizzledMethod)
}


extension UIViewController {

    static let classInit: Void = {
        let originalSelector = #selector(viewWillAppear(_:))
        let swizzledSelector = #selector(asb_viewWillAppear(animated:))
        swizzling(UIViewController.self, originalSelector, swizzledSelector)
    }()

    @objc func asb_viewWillAppear(animated: Bool) {
        asb_viewWillAppear(animated: animated)

        updateStatusBarColor()
    }

    fileprivate func updateStatusBarColor() {
        if !AutomaticStatusBarColor.sharedInstance.disabledViewControllers.contains(self) &&
            AutomaticStatusBarColor.sharedInstance.isEnabled &&
            view.frame.origin == CGPoint(x: 0, y: 0) {
            let customStatusBarViewControllers = AutomaticStatusBarColor.sharedInstance.customStatusBarViewControllers

            if let customTuple = (customStatusBarViewControllers.filter { $0.controller == self }).first {
                UIApplication.shared.statusBarStyle = customTuple.style
            } else {
                UIApplication.shared.statusBarStyle = statusBarAutomaticStyle()
            }
        }
    }

    private func statusBarAutomaticStyle() -> UIStatusBarStyle {
        return UIColor.averageColor(fromImage: statusBarImage()).isLight() ? .default : .lightContent
    }

    private func statusBarImage() -> UIImage? {
        UIGraphicsBeginImageContext(UIApplication.shared.statusBarFrame.size)

        if let ctx = UIGraphicsGetCurrentContext() {
            view.layer.render(in: ctx)
        }

        return UIGraphicsGetImageFromCurrentImageContext()
    }
}


extension UIViewController {

    public func force(statusBarStyle style: UIStatusBarStyle) {
        AutomaticStatusBarColor.sharedInstance.force(statusBarStyle: style, forViewController: self)
    }

    public func disableAutomaticStatusBarColor() {
        AutomaticStatusBarColor.sharedInstance.disable(forViewController: self)
    }

    public func reloadAutomaticStatusBarColor() {
        updateStatusBarColor()
    }
}
