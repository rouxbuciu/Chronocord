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
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var disclaimerLabel: UILabel!
    
    
    // MARK: - Variables
    
    private var appTitle: ShineLabel!

    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        Analytics.logEvent(Constants.AnalyticEvents.Login.loginViewPresented,
//                           parameters: nil)
        setUpAppTitleLabel()
        setUpFacebookButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareUIForAnimations()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        Analytics.setScreenName("Screen name", screenClass: "Screen class")
        introAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // MARK: - Private methods
    
    private func setUpAppTitleLabel() {
        appTitle = ShineLabel(frame: CGRect(x: 0,
                                            y: 0,
                                            width: self.view.bounds.width - 20,
                                            height: 100))
        appTitle.numberOfLines = 1
        appTitle.text = "CHRONOCORD"
        appTitle.font = DesignConstants.UIElements.headerFont
        appTitle.textColor = DesignConstants.Colours.UI.primaryTeal
        appTitle.textAlignment = .center
        appTitle.center.x = self.view.center.x
        appTitle.center.y = self.view.center.y
        self.view.addSubview(appTitle)
    }
    
    private func setUpFacebookButton() {
        facebookButton.layer.cornerRadius = 10.0
        facebookButton.setTitle(TextConstants.loginViewText.facebookButton, for: .normal)
        facebookButton.backgroundColor = DesignConstants.Colours.UI.facebookBlue
    }
    
    private func prepareUIForAnimations() {
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
        appTitle.shineDuration = 3.0
        appTitle.shineWithCompletion {
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
            self.appTitle.center.y -= heightAdjustment - 20
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

