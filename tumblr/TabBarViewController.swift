//
//  TabBarViewController.swift
//  tumblr
//
//  Created by Sam Huskins on 2/25/16.
//  Copyright © 2016 Sam Huskins. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var popupView: UIImageView!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    var popupOriginalPos: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])
        self.popupOriginalPos  = self.popupView.center
        
        UIView.animateWithDuration(1, delay: 0, options: [.Repeat, .Autoreverse], animations: { () -> Void in
                self.popupView.center.y = 502
            }) { (finished) -> Void in

        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressTab(sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].selected = false
        let previousVC = viewControllers[previousIndex]
        //print(sender.tag)
        
        //Remove the previous ViewController
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.selected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
        
        if sender.tag == 1 {
            self.popupView.alpha = 0
        } else  {
            self.popupView.alpha = 1

        }


    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
