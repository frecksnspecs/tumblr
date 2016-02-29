//
//  LoginViewController.swift
//  tumblr
//
//  Created by Sam Huskins on 2/28/16.
//  Copyright © 2016 Sam Huskins. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var email: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        email.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelTap(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
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
