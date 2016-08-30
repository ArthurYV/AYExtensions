//: Playground - noun: a place where people can play

import UIKit

func clip(rect: CGRect,image: UIImage) -> UIImage {
    
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
    
    image.drawAtPoint(CGPoint(x: -rect.origin.x, y: -rect.origin.y))
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
}

let demoImageView = UIImageView.init(image: UIImage.init(named: "loli2"))
let image = clip(CGRect(x: 10,y: 10,width: 200,height: 200), image: demoImageView.image!)

