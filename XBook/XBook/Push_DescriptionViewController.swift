//
//  Push_DescriptionViewController.swift
//  XBook
//
//  Created by Mr.Xi on 16/3/7.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

import UIKit

typealias Push_DescriptionViewControllerBlock = (description:String) -> Void

class Push_DescriptionViewController: UIViewController {

    var textView:JVFloatLabeledTextField?
    
    var callBack:Push_DescriptionViewControllerBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = kColorWhite
        
        self.textView = JVFloatLabeledTextField(frame: CGRectMake(8, 58, SCREEN_WIDTH - 16, SCREEN_HEIGHT - 58 - 8))
        self.view.addSubview(self.textView!)
        self.textView?.placeholder = "  你可以在这里拽写详细的评价、吐槽、介绍~~"
        self.textView?.font = XXYFont(17)
        self.view.tintColor = UIColor.grayColor()
        self.textView?.becomeFirstResponder()
        
        XKeyBoard.registerKeyBoardHide(self)
        XKeyBoard.registerKeyBoardShow(self)
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
        self.callBack!(description: (self.textView?.text)!)
        
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    /**
     *  键盘遮挡
     */
    func keyboardWillHideNotification(notification:NSNotification){
//        self.textView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func keyboardWillShowNotification(notification:NSNotification){
//        let rect = XKeyBoard.returnKeyBoardWindow(notification)
//        self.textView?.contentInset = UIEdgeInsetsMake(0, 0, rect.size.height, 0)
        
    }
}
