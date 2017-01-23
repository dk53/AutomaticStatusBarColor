//
//  ViewController.swift
//  AutomaticStatusBarColor
//
//  Created by Victor Carmouze on 01/23/2017.
//  Copyright (c) 2017 Victor Carmouze. All rights reserved.
//

import UIKit
import AutomaticStatusBarColor

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AutomaticStatusBarColor.sharedInstance.force(statusBarStyle: .lightContent, forViewController: self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
