//
//  settingsScrollViewController.swift
//  Carousel Assignment
//
//  Created by Patrick Wong on 2/15/15.
//  Copyright (c) 2015 Patrick Wong. All rights reserved.
//

import UIKit

class settingsScrollViewController: UIViewController {

    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    settingsScrollView.frame.size = CGSize(width: 320, height: 504)
        
    settingsScrollView.contentSize = settingsImage.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButton(sender: AnyObject) {
      dismissViewControllerAnimated(false, completion: nil)
    
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
