//: Playground - noun: a place where people can play

import UIKit

func toImage(size: CGSize,view: UIView) -> UIImage {
    
    UIGraphicsBeginImageContextWithOptions(size, true, 0)
    let ctx = UIGraphicsGetCurrentContext()
    
    CGContextSaveGState(ctx)
    view.layer.renderInContext(ctx!)
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return img
}

let demoView = UIView.init(frame: CGRect(x: 0,y: 0,width: 100,height: 100))
demoView.backgroundColor = UIColor.redColor()

let image = toImage(CGSize(width: 50,height: 50), view: demoView)
let demoImageView = UIImageView.init(image: image)

