//
//  UIImage+Extension.swift
//  AYExtensions
//
//  Created by Arthury on 8/29/16.
//  Copyright © 2016 Arthury. All rights reserved.
//

import UIKit

extension UIImage {
    /**
     Mask the image with the given color.
     
     - parameter color: The color use to mask the image.
     
     - returns: A new UIImage object, or nil if an error occurs.
     */
    func maskWithColor(color: UIColor) -> UIImage? {
        
        let maskImage = self.CGImage
        let width = self.size.width
        let height = self.size.height
        let bounds = CGRectMake(0, 0, width, height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedLast.rawValue)
        let bitmapContext = CGBitmapContextCreate(nil, Int(width), Int(height), 8, 0, colorSpace, bitmapInfo.rawValue)
        
        CGContextClipToMask(bitmapContext, bounds, maskImage)
        CGContextSetFillColorWithColor(bitmapContext, color.CGColor)
        CGContextFillRect(bitmapContext, bounds)
        
        if let cImage = CGBitmapContextCreateImage(bitmapContext) {
            let coloredImage = UIImage(CGImage: cImage)
            
            return coloredImage
            
        } else {
            return nil
        } 
    }
}