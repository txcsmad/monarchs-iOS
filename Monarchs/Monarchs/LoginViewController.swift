//
//  ViewController.swift
//  Monarchs
//
//  Created by Caroline Shi on 4/20/16.
//  Copyright © 2016 MadLabs. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var classCodeField: UITextField!
    @IBOutlet weak var loginNameField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var classCode: String?
    var loginName: String?
    
    let lightGreenColor : UIColor = UIColor(red: 99.0/255.0, green: 197.0/255.0, blue: 51.0/255.0, alpha: 1.0)
    
    @IBAction func clickedLogin(sender: AnyObject) {
        classCode = classCodeField.text
        loginName = loginNameField.text
        
        //Authenticate 
        Network.login(classCode!, loginName: loginName!) {
            success in
            if success {
                self.navigationController?.popViewControllerAnimated(true)
            } else {
                //Alert!!
            }
        }
        
    }
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.loginNameField.layer.borderWidth = 1
        self.loginNameField.layer.borderColor = self.lightGreenColor.CGColor
        
        self.classCodeField.layer.borderWidth = 1
        self.classCodeField.layer.borderColor = self.lightGreenColor.CGColor
        
        self.classCodeField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
