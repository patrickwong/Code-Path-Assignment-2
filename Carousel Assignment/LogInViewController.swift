//
//  LogInViewController.swift
//  Carousel Assignment
//
//  Created by Patrick Wong on 2/12/15.
//  Copyright (c) 2015 Patrick Wong. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var signInButtonContainer: UIView!
    @IBOutlet weak var logInText: UIImageView!
    @IBOutlet weak var logInFields: UIView!
    @IBOutlet weak var backButtonDidPress: UIButton!

    var signInContainerOriginalCenter: CGFloat!
    var logInTextOriginalCenter: CGFloat!
    var logInFieldsOriginalCenter: CGFloat!
    var keyboardIsShowing: Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    
    signInContainerOriginalCenter = signInButtonContainer.center.y
    logInTextOriginalCenter = logInText.center.y
    logInFieldsOriginalCenter = logInFields.center.y

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        if (keyboardIsShowing == false){
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.signInButtonContainer.center.y = self.signInButtonContainer.center.y - kbSize.height
            self.logInText.center.y = self.logInText.center.y - kbSize.height
            self.logInFields.center.y = 125
            self.keyboardIsShowing = true
            
            }, completion: nil)}
        }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue

        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
        self.signInButtonContainer.center.y = self.signInContainerOriginalCenter
        self.logInText.center.y = self.logInTextOriginalCenter
        self.logInFields.center.y = self.logInFieldsOriginalCenter
        self.keyboardIsShowing = false
            
            }, completion: nil)
    }
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func signInButtonDidPress(sender: AnyObject) {
         var alertViewSignIn = UIAlertView(title: nil, message: "Signing in...", delegate: self, cancelButtonTitle: nil)
        if (self.emailField.text == "email" && self.passwordField.text == "password"){
                alertViewSignIn.show()
                delay(2, { () -> () in
                alertViewSignIn.dismissWithClickedButtonIndex(0, animated: true)
                self.performSegueWithIdentifier("logInSegue", sender: self)
                })
            }
            else if (self.emailField.text.isEmpty || self.passwordField.text.isEmpty)
            {
                var alertView = UIAlertView(title: "Email Required", message: "Please enter your email address and password", delegate: self, cancelButtonTitle: "OK")
                alertView.show()
            }
            else {
                alertViewSignIn.show()
                delay(2, { () -> () in
                    alertViewSignIn.dismissWithClickedButtonIndex(0, animated: true)
                    var alertView = UIAlertView(title: "Try Again", message: "Incorrect email or password", delegate: self, cancelButtonTitle: "OK")
                    alertView.show()
                })
            }
        }
    @IBAction func backButtonDidPress(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
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


