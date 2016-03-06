//
//  BookTitleView.swift
//  XBook
//
//  Created by xxy on 16/3/4.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

import UIKit

@objc protocol BookTitleDelegate {
    optional func choiceCover()
}

class BookTitleView: UIView {

    var BookCover:UIButton?
    var BookNmae:JVFloatLabeledTextField?
    var BookEditor:JVFloatLabeledTextField?
    
    var delegate:BookTitleDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.BookCover = UIButton(frame: CGRectMake(10, 8, 110, 141))
        self.BookCover?.setImage(UIImage(named: "Cover"), forState: .Normal)
        self.BookCover?.addTarget(self, action: Selector("choiceCover"), forControlEvents: .TouchUpInside)
        
        self.addSubview(self.BookCover!)
        
        self.BookNmae = JVFloatLabeledTextField(frame: CGRectMake(128, 48, SCREEN_WIDTH-128-15, 30))
        self.BookEditor = JVFloatLabeledTextField(frame: CGRectMake(128, 78 + 40, SCREEN_WIDTH-128-15, 30))
        
        self.BookNmae?.placeholder = "书名"
        self.BookEditor?.placeholder = "作者"
        
        self.BookNmae?.floatingLabelFont = XXYFont(16)
        self.BookEditor?.floatingLabelFont = XXYFont(16)
        
        self.BookNmae?.font = XXYFont(16)
        self.BookEditor?.font = XXYFont(16)
        
        self.addSubview(self.BookNmae!)
        self.addSubview(self.BookEditor!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not impleted")
    }
    
    func choiceCover() {
        self.delegate?.choiceCover!()
    }

}
