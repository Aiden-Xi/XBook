//
//  config.swift
//  XBook
//
//  Created by Mr.Xi on 16/3/2.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

import Foundation

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width

let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

let kColorRed = UIColor(colorLiteralRed: 235/255, green: 114/255, blue: 118/255, alpha: 1)
let kColorWhite = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
let kColorBlack = UIColor(colorLiteralRed: 0/255, green: 0/255, blue: 0/255, alpha: 1)
let kColorClear = UIColor.clearColor()

func RGB(r:Float, g:Float, b:Float) -> UIColor {
    return UIColor(colorLiteralRed: r/255, green: g/255, blue: b/255, alpha: 1)
}

let MY_FONT = "Bauhaus ITC"

func XXYFont(fontNumber: CGFloat) -> UIFont {
    return UIFont(name: MY_FONT, size: fontNumber)!
}

func printLog<T>(message: T, file: String = __FILE__, method: String = __FUNCTION__, line: Int = __LINE__) {
    // 这里在发布之前需要设置为 0
    let debug = NSNumber(int: 1).boolValue
    
    if debug {
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    }
}
