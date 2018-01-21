//
//  LoginVC.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-19.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var facebookButton: UIButton!
    

    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        Analytics.logEvent(Constants.AnalyticEvents.Login.loginViewPresented,
//                           parameters: nil)
        
        appTitle.textColor = StandardColours.UI.primaryTeal
        facebookButton.layer.cornerRadius = 10.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareUIForAnimations()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        introAnimation()
//        Analytics.setScreenName("Screen name", screenClass: "Screen class")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // MARK: - Private methods
    
    private func prepareUIForAnimations() {
        appTitle.alpha = 0.0
        icon.alpha = 1.0
    }

    private func introAnimation() {
        hideIconAnimation()
        showTitleAnimation()
        showTextElementsAnimation()
    }
    
    private func hideIconAnimation() {
        UIView.animate(withDuration: 1.5, animations: {
            self.icon.alpha = 0.1
        })
    }
    
    private func showTitleAnimation() {
        UIView.animate(withDuration: 2.3, delay: 0.6,  animations: {
            self.appTitle.alpha = 1.0
        }) { (true) in
            self.raiseTitleAnimation()
            self.showButtonAnimation()
        }
    }
    
    private func raiseTitleAnimation() {
        let heightAdjustment: CGFloat = 100
        UIView.animate(withDuration: 2.0, delay: 0.0, animations: {
            self.icon.center.y -= heightAdjustment
        })
        
        UIView.animate(withDuration: 2.0, delay: 0.2, animations: {
            self.appTitle.center.y -= heightAdjustment - 10
        })
    }
    
    private func showButtonAnimation() {
        UIView.animate(withDuration: 1.0,
                       delay: 0.2,
                       options: [.curveEaseOut],
                       animations: {
            self.facebookButton.center.y -= CGFloat(integerLiteral: 200)
        })
    }
    
    private func showTextElementsAnimation() {
        
    }

}

