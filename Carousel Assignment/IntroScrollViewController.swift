//
//  IntroScrollViewController.swift
//  Carousel Assignment
//
//  Created by Patrick Wong on 2/12/15.
//  Copyright (c) 2015 Patrick Wong. All rights reserved.
//

import UIKit

class IntroScrollViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introScrollViewContent: UIView!
    @IBAction func SignInButtonDidPress(sender: AnyObject) {
    
    }
    
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile6: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    
    // Array of offset values
    var xOffSets : [Float] = [-30, 75, -66, 10, -200, -15]
    var yOffSets : [Float] = [-285, -240, -415, -408, -480, -500]
    var scales: [Float] = [1, 1.64, 1.7, 1.6, 1.65, 1.65]
    var rotations: [Float] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        introScrollView.delegate = self
        introScrollView.frame.size = self.view.frame.size
        introScrollView.contentSize = introScrollViewContent.frame.size
        
//    var fahrenheit = convertValue(25, 0, 100, 32, 212)
//    println("F \(fahrenheit)")
//    var celcius = convertValue(212, 32, 212, 0, 100)
//    println("C \(celcius)")
        
        // Set initial values of tiles

        tile1.transform = CGAffineTransformMakeTranslation(CGFloat(xOffSets[0]), CGFloat(yOffSets[0]))
        tile1.transform = CGAffineTransformScale(tile1.transform, CGFloat(scales[0]), CGFloat(scales[0]))
        tile1.transform = CGAffineTransformRotate(tile1.transform, CGFloat(Double(rotations[0]) * M_PI / 180))

        tile2.transform = CGAffineTransformMakeTranslation(CGFloat(xOffSets[1]), CGFloat(yOffSets[1]))
        tile2.transform = CGAffineTransformScale(tile2.transform, CGFloat(scales[1]), CGFloat(scales[1]))
        tile2.transform = CGAffineTransformRotate(tile2.transform, CGFloat(Double(rotations[1]) * M_PI / 180))
        
        tile3.transform = CGAffineTransformMakeTranslation(CGFloat(xOffSets[2]), CGFloat(yOffSets[2]))
        tile3.transform = CGAffineTransformScale(tile3.transform, CGFloat(scales[2]), CGFloat(scales[2]))
        tile3.transform = CGAffineTransformRotate(tile3.transform, CGFloat(Double(rotations[2]) * M_PI / 180))
        
        tile4.transform = CGAffineTransformMakeTranslation(CGFloat(xOffSets[3]), CGFloat(yOffSets[3]))
        tile4.transform = CGAffineTransformScale(tile4.transform, CGFloat(scales[3]), CGFloat(scales[3]))
        tile4.transform = CGAffineTransformRotate(tile4.transform, CGFloat(Double(rotations[3]) * M_PI / 180))
        
        tile5.transform = CGAffineTransformMakeTranslation(CGFloat(xOffSets[4]), CGFloat(yOffSets[4]))
        tile5.transform = CGAffineTransformScale(tile5.transform, CGFloat(scales[4]), CGFloat(scales[4]))
        tile5.transform = CGAffineTransformRotate(tile5.transform, CGFloat(Double(rotations[4]) * M_PI / 180))
        
        tile6.transform = CGAffineTransformMakeTranslation(CGFloat(xOffSets[5]), CGFloat(yOffSets[5]))
        tile6.transform = CGAffineTransformScale(tile6.transform, CGFloat(scales[5]), CGFloat(scales[5]))
        tile6.transform = CGAffineTransformRotate(tile6.transform, CGFloat(Double(rotations[5]) * M_PI / 180))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!){
        var offset = Float(introScrollView.contentOffset.y)
        println("offset: \(introScrollView.contentOffset.y)")
        
        // content offset goes from: 0 -> 568
        // x offset: -30 -> 0, y offset: -285 -> 0
        
        //Tile 1
        var translationX1 = convertValue(offset, 0, 568, xOffSets[0], 0)
        var translationY1 = convertValue(offset, 0, 568, yOffSets[0], 0)
        var scale1 = convertValue(offset, 0, 568, scales[0], 1)
        var rotation1 = convertValue(offset, 0, 568, rotations[0], 0)
        
        tile1.transform = CGAffineTransformMakeTranslation(CGFloat(translationX1), CGFloat(translationY1))
        tile1.transform = CGAffineTransformScale(tile1.transform, CGFloat(scale1), CGFloat(scale1))
        tile1.transform = CGAffineTransformRotate(tile1.transform, CGFloat(Double(rotation1) * M_PI / 180))
        
        //Tile 2
        var translationX2 = convertValue(offset, 0, 568, xOffSets[1], 0)
        var translationY2 = convertValue(offset, 0, 568, yOffSets[1], 0)
        var scale2 = convertValue(offset, 0, 568, scales[1], 1)
        var rotation2 = convertValue(offset, 0, 568, rotations[1], 0)
        
        tile2.transform = CGAffineTransformMakeTranslation(CGFloat(translationX2), CGFloat(translationY2))
        tile2.transform = CGAffineTransformScale(tile2.transform, CGFloat(scale2), CGFloat(scale2))
        tile2.transform = CGAffineTransformRotate(tile2.transform, CGFloat(Double(rotation2) * M_PI / 180))
        
        //Tile 3
        var translationX3 = convertValue(offset, 0, 568, xOffSets[2], 0)
        var translationY3 = convertValue(offset, 0, 568, yOffSets[2], 0)
        var scale3 = convertValue(offset, 0, 568, scales[2], 1)
        var rotation3 = convertValue(offset, 0, 568, rotations[2], 0)
        
        tile3.transform = CGAffineTransformMakeTranslation(CGFloat(translationX1), CGFloat(translationY1))
        tile3.transform = CGAffineTransformScale(tile3.transform, CGFloat(scale3), CGFloat(scale3))
        tile3.transform = CGAffineTransformRotate(tile3.transform, CGFloat(Double(rotation3) * M_PI / 180))
        
        //Tile 4
        var translationX4 = convertValue(offset, 0, 568, xOffSets[3], 0)
        var translationY4 = convertValue(offset, 0, 568, yOffSets[3], 0)
        var scale4 = convertValue(offset, 0, 568, scales[3], 1)
        var rotation4 = convertValue(offset, 0, 568, rotations[3], 0)
        
        tile4.transform = CGAffineTransformMakeTranslation(CGFloat(translationX4), CGFloat(translationY4))
        tile4.transform = CGAffineTransformScale(tile4.transform, CGFloat(scale4), CGFloat(scale4))
        tile4.transform = CGAffineTransformRotate(tile4.transform, CGFloat(Double(rotation4) * M_PI / 180))
        
        //Tile 5
        var translationX5 = convertValue(offset, 0, 568, xOffSets[4], 0)
        var translationY5 = convertValue(offset, 0, 568, yOffSets[4], 0)
        var scale5 = convertValue(offset, 0, 568, scales[4], 1)
        var rotation5 = convertValue(offset, 0, 568, rotations[4], 0)
        
        tile5.transform = CGAffineTransformMakeTranslation(CGFloat(translationX5), CGFloat(translationY5))
        tile5.transform = CGAffineTransformScale(tile5.transform, CGFloat(scale5), CGFloat(scale5))
        tile5.transform = CGAffineTransformRotate(tile5.transform, CGFloat(Double(rotation1) * M_PI / 180))
        
        //Tile 6
        var translationX6 = convertValue(offset, 0, 568, xOffSets[5], 0)
        var translationY6 = convertValue(offset, 0, 568, yOffSets[5], 0)
        var scale6 = convertValue(offset, 0, 568, scales[5], 1)
        var rotation6 = convertValue(offset, 0, 568, rotations[5], 0)
        
        tile6.transform = CGAffineTransformMakeTranslation(CGFloat(translationX6), CGFloat(translationY6))
        tile6.transform = CGAffineTransformScale(tile6.transform, CGFloat(scale6), CGFloat(scale6))
        tile6.transform = CGAffineTransformRotate(tile6.transform, CGFloat(Double(rotation6) * M_PI / 180))
        
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
