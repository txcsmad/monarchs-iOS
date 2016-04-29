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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //Added comment
        
    }


}

