//
//  pushNewBookViewController.swift
//  XBook
//
//  Created by Mr.Xi on 16/3/3.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

import UIKit

class pushNewBookViewController: UIViewController, BookTitleDelegate, PhotoPickerDelegate, VPImageCropperDelegate, UITableViewDataSource, UITableViewDelegate {

    var BookTitle:BookTitleView?
    var tableView:UITableView?
    
    // 存放标题数组
    var titleArray:Array<String> = []
    // 显示第一行标题的子标题内容
    var Book_Title = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = kColorWhite
        
        self.BookTitle = BookTitleView(frame: CGRectMake(0, 40, SCREEN_WIDTH, 160))
        self.BookTitle?.delegate = self
        self.view.addSubview(self.BookTitle!)
        
        self.tableView = UITableView(frame: CGRectMake(0, 200, SCREEN_WIDTH, SCREEN_HEIGHT - 200))
        // 使后面没有内容的cell下部底线 消除
        self.tableView?.tableFooterView = UIView()
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView?.backgroundColor = ColorRGB(250, g: 250, b: 250)
        
        self.view.addSubview(self.tableView!)
        
        self.titleArray = ["标题", "评分", "分类", "书评"]
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
        let CroVC = VPImageCropperViewController(image: image, cropFrame: CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_WIDTH * 1.273), limitScaleRatio: 3)
        CroVC.delegate = self
        self.presentViewController(CroVC, animated: true) { () -> Void in
            
        }
    }
    
    /**
     VPImageCropperDelegate
     */
    func imageCropperDidCancel(cropperViewController: VPImageCropperViewController!) {
        cropperViewController.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    func imageCropper(cropperViewController: VPImageCropperViewController!, didFinished editedImage: UIImage!) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            self.BookTitle?.BookCover?.setImage(editedImage, forState: .Normal)
        }
    }
    
    /**
     *  UITableViewDelegate  &&  UITableViewDataSource
     */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        if(indexPath.row != 1){
            cell.accessoryType = .DisclosureIndicator
        }
        cell.textLabel?.text = self.titleArray[indexPath.row]
        cell.textLabel?.font = XXYFont(15)
        cell.detailTextLabel?.font = XXYFont(13)
        switch indexPath.row {
        case 0:
            cell.detailTextLabel?.text = self.Book_Title
            break
        case 1:
            break
        case 2:
            break
        case 3:
            break
        default:
            break
        }
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView?.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            self.tableViewSelectTitle()
            break
        case 1:
            self.tableViewSelectScore()
            break
        case 2:
            self.tableViewSelectType()
            break
        case 3:
            self.tableViewSelectDescription()
            break
        default:
            break
            
        }
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        // 取消cell的点击效果
        self.tableView?.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            self.tableViewSelectTitle()
            break
        case 1:
            self.tableViewSelectScore()
            break
            
        case 2:
            self.tableViewSelectType()
            break
        case 3:
            self.tableViewSelectDescription()
            break
        default:
            break
        }
    }
    
    /**
     选择标题
     */
    func tableViewSelectTitle() {
        let VC = Push_TitleViewController()
        
        GeneralFactory.addTitleWithTitle(VC)
        VC.callBlock = ({(Title:String) -> Void in
            self.Book_Title = Title
            
            self.tableView?.reloadData()
        })
        
        self.presentViewController(VC, animated: true) { () -> Void in
            
        }
    }
    
    /**
     选择评分
     */
    func tableViewSelectScore() {
        let VC = Push_ScoreViewController()
        
        GeneralFactory.addTitleWithTitle(VC)
        
        self.presentViewController(VC, animated: true) { () -> Void in
            
        }

    }
    
    /**
     选择分类
     */
    func tableViewSelectType() {
        let VC = Push_TypeViewController()
        
        GeneralFactory.addTitleWithTitle(VC)
        
        self.presentViewController(VC, animated: true) { () -> Void in
            
        }

    }
    
    /**
     选择书评
     */
    func tableViewSelectDescription() {
        let VC = Push_DescriptionViewController()
        
        GeneralFactory.addTitleWithTitle(VC)
        
        self.presentViewController(VC, animated: true) { () -> Void in
            
        }

    }
    
    func close() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    func sure() {
        
    }
    
}
