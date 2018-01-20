//
//  ViewController.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-19.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        Analytics.logEvent(Constants.AnalyticEvents.Login.loginViewPresented,
//                           parameters: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
                
//        Analytics.setScreenName("Screen name", screenClass: "Screen class")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

