//
//  UIView+Extension.swift
//  AYExtensions_iOS
//
//  Created by Arthury on 8/30/16.
//  Copyright © 2016 Arthury. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     Create a new image with given size,the image content is the same as the view.
     
     - parameter size: The size of the new image.
     
     - returns: The new image object.
     */
    func toImage(size: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        let ctx = UIGraphicsGetCurrentContext()
        
        CGContextSaveGState(ctx)
        layer.renderInContext(ctx!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }
}
