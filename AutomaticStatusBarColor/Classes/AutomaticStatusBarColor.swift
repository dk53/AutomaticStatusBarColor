//
//  AppDelegate.swift
//  AutomaticStatusBarColor
//
//  Created by Victor Carmouze on 01/23/2017.
//  Copyright (c) 2017 Victor Carmouze. All rights reserved.
//

public class AutomaticStatusBarColor {

    public static let sharedInstance = AutomaticStatusBarColor()

    fileprivate var disabledViewControllers = [UIViewController]()
    fileprivate var customStatusBarViewControllers = [(controller: UIViewController, style: UIStatusBarStyle)]()

    public var isEnabled = false
    public func disable(forViewController viewController: UIViewController) {
        disabledViewControllers.append(viewController)
    }

    public func force(statusBarStyle style: UIStatusBarStyle, forViewController viewController: UIViewController) {
        customStatusBarViewControllers.append((viewController, style))
    }
}

private let swizzling: (UIViewController.Type) -> () = { viewController in

    let viewWillAppearSelector = #selector(viewController.viewWillAppear(_:))
    let swizzledViewWillAppearSelector = #selector(viewController.asb_viewWillAppear(animated:))

    let originalMethod = class_getInstanceMethod(viewController, viewWillAppearSelector)
    let swizzledMethod = class_getInstanceMethod(viewController, swizzledViewWillAppearSelector)

    method_exchangeImplementations(originalMethod, swizzledMethod)
}

extension UIViewController {

    open override class func initialize() {
        guard self === UIViewController.self else {
            return
        }
        swizzling(self)
    }

    func asb_viewWillAppear(animated: Bool) {
        asb_viewWillAppear(animated: animated)

        if !AutomaticStatusBarColor.sharedInstance.disabledViewControllers.contains(self) &&
            AutomaticStatusBarColor.sharedInstance.isEnabled {
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

            if let navigationController = navigationController, !navigationController.navigationBar.isHidden {
                navigationController.view.layer.render(in: ctx)
            } else {
                view.layer.render(in: ctx)
            }
        }

        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
