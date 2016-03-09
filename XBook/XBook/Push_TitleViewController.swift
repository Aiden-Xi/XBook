//
//  Push_TitleViewController.swift
//  XBook
//
//  Created by Mr.Xi on 16/3/7.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

import UIKit

 /// 闭包的实现
typealias Push_TitleCallBlock = (Title:String) -> Void

class Push_TitleViewController: UIViewController {
    
    var textField:UITextField?
    
    /**
     实现回调的三种方法
     1.Block
     2.Delegate
     3.通知（NSNotifecation）
     */
    var callBack:Push_TitleCallBlock?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = kColorWhite
        
        self.textField = UITextField(frame: CGRectMake(15, 60, SCREEN_WIDTH - 30, 30))
        self.textField?.borderStyle = .RoundedRect
        self.textField?.placeholder = "书评标题"
        self.textField?.font = XXYFont(15)
        self.view.addSubview(self.textField!)
        
        self.textField?.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func close() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    func sure() {
        self.callBack?(Title: self.textField!.text!)
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

}
