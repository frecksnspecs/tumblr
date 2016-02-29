//
//  SearchViewController.swift
//  tumblr
//
//  Created by Sam Huskins on 2/25/16.
//  Copyright © 2016 Sam Huskins. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var loadingImageView: UIImageView!
    @IBOutlet weak var searchFeedView: UIImageView!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var images: [UIImage]!
    var animatedImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //hide the background image feed and show the custom loading indicator
        loadingImageView.alpha = 1
        searchFeedView.alpha = 0
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        images = [loading_1, loading_2, loading_3]
        animatedImage = UIImage.animatedImageWithImages(images, duration: 1.0)
        loadingImageView.image = animatedImage

        
    }
    override func viewDidAppear(animated: Bool) {
        delay(1) { () -> () in
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.searchFeedView.alpha = 1
                self.loadingImageView.alpha = 0
            })
        }
        
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
