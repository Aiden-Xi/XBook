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

let COLOR_RED = UIColor(colorLiteralRed: 235/255, green: 114/255, blue: 118/255, alpha: 1)

func printLog<T>(message: T, file: String = __FILE__, method: String = __FUNCTION__, line: Int = __LINE__) {
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}
