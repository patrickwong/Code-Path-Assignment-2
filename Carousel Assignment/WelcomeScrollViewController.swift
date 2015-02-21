//
//  WelcomeScrollViewController.swift
//  Carousel Assignment
//
//  Created by Patrick Wong on 2/15/15.
//  Copyright (c) 2015 Patrick Wong. All rights reserved.
//

import UIKit

class WelcomeScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var welcomeScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backupButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    welcomeScrollView.delegate = self
        
    welcomeScrollView.contentSize = CGSize(width: 1280, height: welcomeScrollView.bounds.height)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        var page = Int(scrollView.contentOffset.x / 320)
        pageControl.currentPage = page
        
        if (page == 3){
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.backupButton.alpha = 1.0
                self.pageControl.alpha = 0
            })
        } else {
        
            self.backupButton.alpha = 0
            self.pageControl.alpha = 1
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
