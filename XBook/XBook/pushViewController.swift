//
//  pushViewController.swift
//  XBook
//
//  Created by Mr.Xi on 16/3/2.
//  Copyright © 2016 Mr.Xi. All rights reserved.
//

import UIKit

class pushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = COLOR_WHITE

        self.setNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 在navigation上面添加两个按钮
    func setNavigationBar() {
        // 添加一个navigationView
        let navigationView = UIView(frame: CGRectMake(0, -20, SCREEN_WIDTH, 65))
        navigationView.backgroundColor = COLOR_WHITE
        self.navigationController?.navigationBar.addSubview(navigationView)
        
        // 在navigationView上面添加按钮，设置成为BarBtn
        let addBookBtn = UIButton(frame: CGRectMake(20, 20, SCREEN_WIDTH, 45))
        addBookBtn.setImage(UIImage(named: "plus circle"), forState: .Normal)
        addBookBtn.setTitleColor(COLOR_BLACK, forState: .Normal)
        addBookBtn.setTitle("   新建书评", forState: .Normal)
        addBookBtn.titleLabel?.font = XXYFont(16)
        addBookBtn.contentHorizontalAlignment = .Left  // 按钮文字显示在左边
        
        addBookBtn.addTarget(self, action: Selector("pushNewBook"), forControlEvents: .TouchUpInside)
        
        navigationView.addSubview(addBookBtn)
    }
    
    func pushNewBook() {
        let vc = pushNewBookViewController()
        
        GeneralFactory.addTitleWithTitle(vc, title1: "关闭", title2: "发布")
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}
