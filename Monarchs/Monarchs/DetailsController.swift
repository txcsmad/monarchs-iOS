//
//  ViewController.swift
//  Monarchs
//
//  Created by Mark Ruvalcaba on 4/18/16.
//  Copyright © 2016 MadLabs. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {

    @IBOutlet weak var pictureTaken: UIImageView!
    @IBOutlet weak var descriptionOfPicture: UITextView!
    @IBOutlet weak var notesLabel: UILabel!
    var capturedImage: UIImage?
    var notes: String?
    var capturedImageRef = UIImage()

    
    @IBAction func submitPhoto(sender: AnyObject) {
        
        notes = descriptionOfPicture.text
        
        
        navigationController?.popViewControllerAnimated(true)

    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.pictureTaken.image = capturedImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //For keyboard to push up view
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appWillMoveToBackground", name: UIApplicationWillResignActiveNotification, object: nil)
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //Added comment
        
    }
    
    /* HELPER FUNCTIONS FOR KEYBOARD*/
    //For keyboard to push up view
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y -= keyboardSize.height
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y += keyboardSize.height
        }
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }


}

