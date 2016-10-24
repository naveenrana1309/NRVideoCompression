

# NRVideoCompression

[![Version](https://img.shields.io/cocoapods/v/NRVideoCompression.svg?style=flat)](http://cocoapods.org/pods/NRVideoCompression)
[![License](https://img.shields.io/cocoapods/l/NRVideoCompression.svg?style=flat)](http://cocoapods.org/pods/NRVideoCompression)
[![Platform](https://img.shields.io/cocoapods/p/NRVideoCompression.svg?style=flat)](http://cocoapods.org/pods/NRVideoCompression)
![ScreenShot](https://cdn.rawgit.com/naveenrana1309/NRVideoCompression/master/sample.png "Screeshot")

## Introduction

NRVideoCompression: This class is used for compressing the video taken from iPhone camera or from camera roll. There is various circumstances where you want to send videos to the network but because of the high resolution of iPhone camera videos are of very large size which needs to be compressed before we are sending them to network to save the memory. This library helps you to the compress the size of videos according to your quality choices which have options AVAssetExportPresetLowQuality, AVAssetExportPresetMediumQuality, AVAssetExportPresetHighQuality.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
Xcode 7+ , Swift 2 , iOS 9 and above

## Installation

NRVideoCompression is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NRVideoCompression"
```

## Usage
# compressVideo

```

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
self.originalVideoSize.text = "original video size\(sizeinMB)"

}

}

func imagePickerControllerDidCancel(picker: UIImagePickerController) {
picker.dismissViewControllerAnimated(true, completion: nil)
}

@IBAction func compressButtonClicked(sender: UIButton) {
if let _ = self.originalVideoUrl {
NRVideoCompressor.compressVideoWithQuality(AVAssetExportPresetLowQuality, inputURL: originalVideoUrl!, completionHandler: { (outputUrl) in

let compressSize = NSData(contentsOfURL: outputUrl)
let sizeinMB = NSByteCountFormatter.stringFromByteCount(Int64((compressSize?.length)!), countStyle: .File)
self.newVideoSize.text = sizeinMB
})

}
}
}

```



## Contributing

Contributions are always welcome! (:

1. Fork it ( http://github.com/naveenrana1309/NRVideoCompression/fork )
2. Create your feature branch ('git checkout -b my-new-feature')
3. Commit your changes ('git commit -am 'Add some feature')
4. Push to the branch ('git push origin my-new-feature')
5. Create new Pull Request

## Compatibility

Xcode 8+ , Swift 3 , iOS 9 and above

## Author

Naveen Rana. [See Profile](https://www.linkedin.com/in/naveen-rana-9a371a40)

Email: 
naveenrana1309@gmail.com. 

Check out [Facebook Page](https://www.facebook.com/iOSByHeart/) for detail.

## License

NRVideoCompression is available under the MIT license. See the LICENSE file for more info.
