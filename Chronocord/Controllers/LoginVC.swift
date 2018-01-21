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
    
    @IBOutlet weak var disclaimerButton: UIButton!
    @IBOutlet weak var disclaimerLabel: UnderlinedLabel!
    @IBOutlet weak var disclaimerDismissOutside: UIButton!
    @IBOutlet weak var disclaimerDismissInside: UIButton!
    @IBOutlet weak var disclaimerView: UIView!
    @IBOutlet weak var disclaimerTitle: UILabel!
    @IBOutlet weak var disclaimerText: UILabel!
    
    
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
        setUpDisclaimerElements()
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
    
    
    // MARK: - Button Actions
    
    @IBAction func facebookButtonTapped(_ sender: Any) {
    }

    @IBAction func showDisclaimerButtonTapped(_ sender: Any) {
        showDisclaimerElementsAnimation()
    }
    
    @IBAction func hideDisclaimerButtonTapped(_ sender: Any) {
        hideDisclaimerElementsAnimation()
    }
    
    
    
    // MARK: - View setup
    
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
        facebookButton.layer.cornerRadius = 20.0
        facebookButton.setTitle(TextConstants.loginViewText.facebookButton, for: .normal)
        facebookButton.backgroundColor = DesignConstants.Colours.UI.facebookBlue
    }
    
    private func setUpDisclaimerElements() {
        disclaimerLabel.text = TextConstants.loginViewText.disclaimerLabel
        disclaimerLabel.textAlignment = .center
        disclaimerLabel.textColor = UIColor.white
        disclaimerLabel.font = UIFont.boldSystemFont(ofSize: 13)
        
        disclaimerDismissOutside.backgroundColor = DesignConstants.Colours.UI.darkGrey
        disclaimerDismissOutside.alpha = 0.0
        
        disclaimerTitle.text = TextConstants.loginViewText.disclaimerTitle
        disclaimerTitle.textAlignment = .center
        disclaimerTitle.textColor = UIColor.white
        disclaimerTitle.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        disclaimerText.text = TextConstants.loginViewText.disclaimerText
        disclaimerText.textAlignment = .center
        disclaimerText.textColor = UIColor.white
        disclaimerText.numberOfLines = 0
        disclaimerText.font = UIFont.systemFont(ofSize: 13)
        
        disclaimerView.backgroundColor = DesignConstants.Colours.UI.primaryGrey
        disclaimerView.layer.cornerRadius = 20.0
    }
    
    private func prepareUIForAnimations() {
        icon.alpha = 1.0
    }
    
    
    // MARK: - Intro animations

    private func introAnimation() {
        hideIconAnimation()
        showTitleAnimation()
    }
    
    private func hideIconAnimation() {
        UIView.animate(withDuration: 1.5, animations: {
            self.icon.alpha = 0.1
        })
    }
    
    private func showTitleAnimation() {
        appTitle.shineDuration = 2.5
        appTitle.shineWithCompletion {
            self.raiseTitleAnimation()
            self.showButtonAnimation()
        }
    }
    
    private func raiseTitleAnimation() {
        let heightAdjustment: CGFloat = 100
        UIView.animate(withDuration: 1.0, delay: 0.0, animations: {
            self.icon.center.y -= heightAdjustment
        })
        
        UIView.animate(withDuration: 1.0, delay: 0.2, animations: {
            self.appTitle.center.y -= heightAdjustment - 17
        })
    }
    
    private func showButtonAnimation() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.2,
                       options: [.curveEaseOut],
                       animations: {
            self.facebookButton.center.y -= CGFloat(integerLiteral: 200)
            self.disclaimerLabel.center.y -= CGFloat(integerLiteral: 200)
            self.disclaimerButton.center.y -= CGFloat(integerLiteral: 200)
        })
    }
    
    
    // MARK: - Disclaimer animations
    
    private func showDisclaimerElementsAnimation() {
        UIView.animate(withDuration: 0.2) {
            self.disclaimerDismissOutside.alpha = 0.4
            self.disclaimerView.center.y -= CGFloat(integerLiteral: 325)
        }
    }

    private func hideDisclaimerElementsAnimation() {
        UIView.animate(withDuration: 0.2) {
            self.disclaimerDismissOutside.alpha = 0.0
            self.disclaimerView.center.y += CGFloat(integerLiteral: 325)
        }
    }
}

