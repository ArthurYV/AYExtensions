//: Playground - noun: a place where people can play

import AppKit

let demoImageView = NSImageView.init()
demoImageView.frame = CGRect(x: 0,y: 0,width: 100,height: 100)
demoImageView.image = NSImage.init(named: "lock")



func cutStringWithStr(targetStr:String,str:String) -> String? {
    let range: Range<String.Index>? = str.rangeOfString(targetStr)
    if let unWrappedRange = range{
        let index: Int = str.startIndex.distanceTo(unWrappedRange.startIndex)
        let endIndex = str.startIndex.advancedBy(index-1)
        let finalRange = str.startIndex...endIndex
        return str[finalRange]
    }else{
        return nil
    }
}

let str = "akbckada"
cutStringWithStr("ka",str: str)
