//: Playground - noun: a place where people can play

import UIKit

func maskWithColor(color: UIColor,image:UIImage) -> UIImage? {
    
    let maskImage = image.CGImage
    let width = image.size.width
    let height = image.size.height
    let bounds = CGRectMake(0, 0, width, height)
    
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedLast.rawValue)
    let bitmapContext = CGBitmapContextCreate(nil, Int(width), Int(height), 8, 0, colorSpace, bitmapInfo.rawValue) //needs rawValue of bitmapInfo
    
    CGContextClipToMask(bitmapContext, bounds, maskImage)
    CGContextSetFillColorWithColor(bitmapContext, color.CGColor)
    CGContextFillRect(bitmapContext, bounds)
    
    //is it nil?
    if let cImage = CGBitmapContextCreateImage(bitmapContext) {
        let coloredImage = UIImage(CGImage: cImage)
        
        return coloredImage
        
    } else {
        return nil
    }
}


let demoImage = UIImage.init(named: "lock")

maskWithColor(UIColor.redColor(),image: demoImage!)

let demoImageView = UIImageView(image: demoImage)
demoImageView.frame = CGRect(x: 0,y: 0,width: 100,height: 100)


//change image color