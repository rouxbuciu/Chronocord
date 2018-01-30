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
    
    fileprivate var selectedIndex = 0
    fileprivate var transitionPoint: CGPoint!
    @IBOutlet weak var containerView: UIView!
    
    lazy fileprivate var menuAnimator : MenuTransitionAnimator! = MenuTransitionAnimator(mode: .presentation, shouldPassEventsOutsideMenu: false) { [unowned self] in
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainVC: MenuViewControllerDelegate {
    
    func menu(_: MenuViewController, didSelectItemAt index: Int, at point: CGPoint) {
        transitionPoint = point
        selectedIndex = index
        
        var newView: TodayVC!
        newView = TodayVC(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 200,
                                        height: 200))
        self.containerView.addSubview(newView)
    
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
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
