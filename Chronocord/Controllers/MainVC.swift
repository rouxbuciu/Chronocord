//
//  MainVC.swift
//  Chronocord
//
//  Created by roux g. buciu on 2018-01-30.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import UIKit
import SideMenu

class MainVC: UIViewController {
    
    // MARK - Variables
    
    fileprivate var selectedIndex = 0
    fileprivate var transitionPoint: CGPoint!
    
    lazy fileprivate var menuAnimator : MenuTransitionAnimator! = MenuTransitionAnimator(mode: .presentation, shouldPassEventsOutsideMenu: false) { [unowned self] in
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet var backgroundView:           UIView!
    @IBOutlet weak var containerView:       UIView!
    
    @IBOutlet weak var navBar:              UIView!
    @IBOutlet weak var appTitle:            UILabel!
    
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialViewSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Private functions
    
    private func initialViewSetup() {
        appTitle.font                       = DesignConstants.UIElements.appNavFont
        appTitle.textColor                  = DesignConstants.Colours.UI.primaryTeal
        appTitle.textAlignment              = .center
        
        navBar.backgroundColor              = DesignConstants.Colours.UI.primaryGrey
        
        backgroundView.backgroundColor      = DesignConstants.Colours.UI.primaryGrey
    }
    
    
    
    @IBAction func presentMenuPressed(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let menu = mainStoryboard.instantiateViewController(withIdentifier: "Menu") as! MenuViewController
        menu.selectedItem = selectedIndex
        menu.delegate = self
        menu.transitioningDelegate = self
        menu.modalPresentationStyle = .custom
        self.present(menu, animated: true, completion: nil)
    }

}

extension MainVC: MenuViewControllerDelegate {
    
    func menu(_: MenuViewController, didSelectItemAt index: Int, at point: CGPoint) {
        transitionPoint = point
        selectedIndex = index
        
        for view in containerView.subviews {
            view.removeFromSuperview()
        }
        let view = selectViewFromIndex(selectedIndex)
        self.containerView.addSubview(view)
        
    
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func selectViewFromIndex(_ index: Int) -> UIView {
        if index == 0 {
            var newView: TodayVC!
            newView = TodayVC(frame: containerView.bounds)
            return newView
            
        } else if index == 1 {
            var newView: ActivitiesVC!
            newView = ActivitiesVC(frame: containerView.bounds)
            return newView
            
        } else if index == 2 {
            var newView: PhysicalVC!
            newView = PhysicalVC(frame: containerView.bounds)
            return newView
            
        } else if index == 3 {
            var newView: SocialVC!
            newView = SocialVC(frame: containerView.bounds)
            return newView
            
        } else if index == 4 {
            var newView: OtherVC!
            newView = OtherVC(frame: containerView.bounds)
            return newView
            
        } else if index == 5 {
            var newView: HelpVC!
            newView = HelpVC(frame: containerView.bounds)
            return newView
            
        } else if index == 6 {
            var newView: SettingsVC!
            newView = SettingsVC(frame: containerView.bounds)
            return newView
            
        } else {
            var newView: TodayVC!
            newView = TodayVC(frame: containerView.bounds)
            return newView
        }
    }
    
    func menuDidCancel(_: MenuViewController) {
        dismiss(animated: true, completion: nil)
    }
}


extension MainVC: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting _: UIViewController,
                             source _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return menuAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MenuTransitionAnimator(mode: .dismissal)
    }
}
