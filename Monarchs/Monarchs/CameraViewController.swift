//
//  CameraViewController.swift
//  Monarchs
//
//  Created by Caroline Shi on 4/20/16.
//  Copyright © 2016 MadLabs. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    @IBOutlet weak var loginInfo: UILabel!
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var loginButton: UIBarButtonItem!
    
    var captureSession: AVCaptureSession?
    var stillImageOutput: AVCaptureStillImageOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    var image: UIImage?
    

    @IBAction func loginClicked(sender: UIBarButtonItem) {
        //.self?????
        self.performSegueWithIdentifier("Login Segue", sender: loginButton)
        
    }
    
    
    @IBAction func aboutClicked(sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "About", message: "Notes about monarch season, the app, etc.", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func didPressTakePhoto(sender: UIBarButtonItem) {
        
        if let videoConnection = stillImageOutput!.connectionWithMediaType(AVMediaTypeVideo) {
            videoConnection.videoOrientation = AVCaptureVideoOrientation.Portrait
            stillImageOutput?.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: {(sampleBuffer, error) in
                
                if (sampleBuffer != nil) {
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    let dataProvider = CGDataProviderCreateWithCFData(imageData)
                    let cgImageRef = CGImageCreateWithJPEGDataProvider(dataProvider, nil, true, CGColorRenderingIntent.RenderingIntentDefault)
                    
                    self.image = UIImage(CGImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.Right)
//                    self.capturedImage.image = image
                    self.performSegueWithIdentifier("Pass Image", sender: self.image)
                }
            })
        }
        

        
    }

    
    //MARK: Override funcs
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        view.sendSubviewToBack(previewView)
        
        captureSession!.sessionPreset = AVCaptureSessionPresetPhoto
        
        let backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        var error: NSError?
        var input: AVCaptureDeviceInput!
        do {
            input = try AVCaptureDeviceInput(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if error == nil && captureSession!.canAddInput(input) {
            captureSession!.addInput(input)
            
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput!.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
            if captureSession!.canAddOutput(stillImageOutput) {
                captureSession!.addOutput(stillImageOutput)
                
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer!.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer!.connection?.videoOrientation = AVCaptureVideoOrientation.Portrait
                previewView.layer.addSublayer(previewLayer!)
                
                captureSession!.startRunning()
            }
        }
        
        
        if let currentUser = Network.currentUser {
            loginInfo.text = "You are logged in as " + currentUser.loginName
        }
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer!.frame = previewView.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captureSession = AVCaptureSession()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "Pass Image" {
            let a = segue.destinationViewController as! DetailsController
            a.capturedImage = sender as? UIImage

        }
        
        // Pass the selected object to the new view controller.
        
        
    }
 

}
