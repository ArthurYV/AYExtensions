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
