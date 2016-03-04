//
//  GeneralFactory.swift
//  XBook
//
//  Created by Mr.Xi on 16/3/3.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

import UIKit

class GeneralFactory: NSObject {

    static func addTitleWithTitle(target: UIViewController, title1: String = "关闭", title2: String = "确定") {
        let btn1 = UIButton(frame: CGRectMake(10, 20, 40, 20))
        btn1.setTitle(title1, forState: .Normal)
        btn1.contentHorizontalAlignment = .Left
        btn1.setTitleColor(COLOR_RED, forState: .Normal)
        btn1.titleLabel?.font = XXYFont(14)
        target.view.addSubview(btn1)
        
        let btn2 = UIButton(frame: CGRectMake(SCREEN_WIDTH - 50, 20, 40, 20))
        btn2.setTitle(title2, forState: .Normal)
        btn2.contentHorizontalAlignment = .Right
        btn2.setTitleColor(COLOR_RED, forState: .Normal)
        btn2.titleLabel?.font = XXYFont(14)
        target.view.addSubview(btn2)
        
        if target.respondsToSelector(Selector("close")) {
            btn1.addTarget(target, action: Selector("close"), forControlEvents: .TouchUpInside)
        }
        
        if target.respondsToSelector(Selector("sure")) {
            btn2.addTarget(target, action: Selector("sure"), forControlEvents: .TouchUpInside)
        }
    }
}
