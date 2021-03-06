//
//  String+Extension.swift
//  AYExtensions
//
//  Created by Arthury on 8/28/16.
//  Copyright © 2016 Arthury. All rights reserved.
//

#if os(OSX)
    import AppKit
#else
    import UIKit
#endif

extension String {
    
    var slice: ArraySlice<Character> {
        return ArraySlice(self.characters)
    }
    
    var securityString: String {
        
        let length = self.characters.count
        let securityLength = (length + 1) / 2
        let star = [String](count: securityLength, repeatedValue: "*").joinWithSeparator("")
        let start = self.startIndex.advancedBy(securityLength / 2)
        let range = start ..< start.advancedBy(securityLength)
        return stringByReplacingCharactersInRange(range, withString: star)
    }
    
    /**
     Cut the string from start to the target string,not included the target string.
     
     - parameter targetStr: the target Stirng.
     
     - returns: A new sub string, or nil if an error occurs.
     */
    func cutStringWithStr(targetStr:String) -> String? {
        let range: Range<String.Index>? = self.rangeOfString(targetStr)
        if let unWrappedRange = range{
            let index: Int = self.startIndex.distanceTo(unWrappedRange.startIndex)
            let endIndex = self.startIndex.advancedBy(index)
            let finalRange = self.startIndex...endIndex
            return self[finalRange]
        }else{
            return nil
        }
    }
    
}
