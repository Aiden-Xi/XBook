//
//  pushNewBookViewController.swift
//  XBook
//
//  Created by Mr.Xi on 16/3/3.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

import UIKit

class pushNewBookViewController: UIViewController, BookTitleDelegate, PhotoPickerDelegate {

    var BookTitle:BookTitleView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = kColorWhite
        
        self.BookTitle = BookTitleView(frame: CGRectMake(0, 40, SCREEN_WIDTH, 160))
        self.BookTitle?.delegate = self
        self.view.addSubview(self.BookTitle!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func choiceCover() {        
        let vc = PhotoPickerViewController()
        vc.delegate = self
        
        self.presentViewController(vc, animated: true) { () -> Void in
            
        }
    }
    
    /**
     PhotoPickerDelegate
     */
    func getImageFromPicker(image: UIImage) {
        self.BookTitle?.BookCover?.setImage(image, forState: .Normal)
    }
        
    func close() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    func sure() {
        
    }
    
}
