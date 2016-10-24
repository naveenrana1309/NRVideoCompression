//
//  ViewController.swift
//  NRVideoCompression
//
//  Created by naveenrana1309 on 10/24/2016.
//  Copyright (c) 2016 naveenrana1309. All rights reserved.
//

import UIKit
import MobileCoreServices
import NRVideoCompression
import AVFoundation

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var originalVideoUrl: NSURL?
    @IBOutlet weak var originalVideoSize: UILabel!
    @IBOutlet weak var newVideoSize: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func openImagePicker() {
        let controller = UIImagePickerController()
        //controller.allowsEditing = false
        controller.sourceType = .Camera
        controller.mediaTypes = [kUTTypeMovie as String]
        controller.delegate = self
        self.presentViewController(controller, animated: true, completion: nil)

    }
    
    //MARK: UIImagePickerController Delegates
     func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        self.originalVideoUrl = info[UIImagePickerControllerMediaURL] as? NSURL
        if let _ = originalVideoUrl {
            if NSFileManager.defaultManager().fileExistsAtPath(self.originalVideoUrl!.absoluteString) {
                try! NSFileManager.defaultManager().removeItemAtURL(self.originalVideoUrl!)
            }

            let originalSize = NSData(contentsOfURL: originalVideoUrl!)
            let sizeinMB = NSByteCountFormatter.stringFromByteCount(Int64((originalSize?.length)!), countStyle: .File)
            self.originalVideoSize.text = "original size\(sizeinMB)"

            
        }
        
    }
    
     func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func selectVideoButtonClicked(sender: UIButton) {
        
        openImagePicker()
    }
    
    @IBAction func compressButtonClicked(sender: UIButton) {
        
        if let _ = self.originalVideoUrl {
            NRVideoCompressor.compressVideoWithQuality(AVAssetExportPresetLowQuality, inputURL: originalVideoUrl!, completionHandler: { (outputUrl) in
                self.originalVideoUrl = nil
                self.originalVideoSize.text = "0 MB"
                let compressSize = NSData(contentsOfURL: outputUrl)
                let sizeinMB = NSByteCountFormatter.stringFromByteCount(Int64((compressSize?.length)!), countStyle: .File)
                self.newVideoSize.text = "compress size \(sizeinMB)"

            })

        }
    }
    
   
    
}

