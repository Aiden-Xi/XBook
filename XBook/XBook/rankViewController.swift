//
//  rankViewController.swift
//  XBook
//
//  Created by Mr.Xi on 16/3/2.
//  Copyright © 2016 Mr.Xi. All rights reserved.
//

import UIKit

class rankViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = kColorRed
        
        let label = UILabel(frame: CGRectMake(0, 0, 100, 20))
        label.text = "哈哈隶书变体"
        label.font = XXYFont(20)
        label.center = self.view.center
        label.adjustsFontSizeToFitWidth = true
        label.tintColor = UIColor.blackColor()
        
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
