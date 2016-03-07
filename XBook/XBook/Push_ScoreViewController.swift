//
//  Push_ScoreViewController.swift
//  XBook
//
//  Created by Mr.Xi on 16/3/7.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

import UIKit

class Push_ScoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = kColorWhite
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
