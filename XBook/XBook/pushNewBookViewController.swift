//
//  pushNewBookViewController.swift
//  XBook
//
//  Created by Mr.Xi on 16/3/3.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

import UIKit

class pushNewBookViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = COLOR_WHITE
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
        
    }
    
}
