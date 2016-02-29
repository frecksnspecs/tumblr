//
//  ComposeViewController.swift
//  tumblr
//
//  Created by Sam Huskins on 2/25/16.
//  Copyright © 2016 Sam Huskins. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!

    var textOriginalPos: CGPoint!
    var photoOriginalPos: CGPoint!
    var quoteOriginalPos: CGPoint!
    var linkOriginalPos: CGPoint!
    var chatOriginalPos: CGPoint!
    var videoOriginalPos: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textOriginalPos = textButton.center
        photoOriginalPos = photoButton.center
        quoteOriginalPos = quoteButton.center
        linkOriginalPos = linkButton.center
        chatOriginalPos = chatButton.center
        videoOriginalPos = videoButton.center

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        textButton.center.y = 616
        photoButton.center.y = 616
        quoteButton.center.y = 616
        linkButton.center.y = 616
        chatButton.center.y = 616
        videoButton.center.y = 616

    }
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.photoButton.center = self.photoOriginalPos
        })
        UIView.animateWithDuration(0.3, delay: 0.2, options: [], animations: { () -> Void in
            self.quoteButton.center = self.quoteOriginalPos
            self.chatButton.center = self.chatOriginalPos
            }, completion: { (finished) -> Void in
        })
        UIView.animateWithDuration(0.3, delay: 0.3, options: [], animations: { () -> Void in
            self.textButton.center = self.textOriginalPos
            }, completion: { (finished) -> Void in
        })
        UIView.animateWithDuration(0.3, delay: 0.4, options: [], animations: { () -> Void in
            self.linkButton.center = self.linkOriginalPos
            }, completion: { (finished) -> Void in
        })
        UIView.animateWithDuration(0.3, delay: 0.5, options: [], animations: { () -> Void in
            self.videoButton.center = self.videoOriginalPos
            }, completion: { (finished) -> Void in
        })

    }

    @IBAction func nevermindTap(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
