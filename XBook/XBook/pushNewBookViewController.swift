//
//  pushNewBookController.swift
//  XBook
//
//  Created by xlx on 15/12/11.
//  Copyright © 2015年 xlx. All rights reserved.
//

import UIKit

class pushNewBookViewController: UIViewController,BookTitleDelegate,PhotoPickerDelegate,VPImageCropperDelegate,UITableViewDelegate,UITableViewDataSource{
    
    var BookTitle:BookTitleView?
    
    var tableView:UITableView?
    
    var titleArray:Array<String> = []
    
    var Book_Title=""
    
    var Score:LDXScore?
    
    /**
     表示是否现实星星
     */
    var showScore = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.BookTitle = BookTitleView(frame: CGRectMake(0,40,SCREEN_WIDTH,160))
        self.BookTitle?.delegate = self
        self.view.addSubview(self.BookTitle!)
        
        self.tableView = UITableView(frame: CGRectMake(0, 200, SCREEN_WIDTH, SCREEN_HEIGHT - 200), style: .Grouped)
        /**
        使没有内容的线条消失
        */
        self.tableView?.tableFooterView = UIView()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView?.backgroundColor = kColorWhite
        self.view.addSubview(self.tableView!)
        
        self.titleArray = ["标题","评分","分类","书评"]
        
        self.Score = LDXScore(frame: CGRectMake(100,10,100,22))
        self.Score?.isSelect = true
        self.Score?.normalImg = UIImage(named: "btn_star_evaluation_normal")
        self.Score?.highlightImg = UIImage(named: "btn_star_evaluation_press")
        self.Score?.max_star = 5
        self.Score?.show_star = 5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    deinit{
        print("pushNewBookViewController reallse")
    }
    /**
     BookTitleDelegate
     */
    
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
        let CroVC = VPImageCropperViewController(image: image, cropFrame: CGRectMake(0,100,SCREEN_WIDTH,SCREEN_WIDTH*1.273), limitScaleRatio: 3)
        CroVC.delegate = self
        self.presentViewController(CroVC, animated: true) { () -> Void in
            
        }
    }
    func close(){
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    func sure(){
        
    }
    
    /**
     *  VPImageDelegate
     */
    func imageCropperDidCancel(cropperViewController: VPImageCropperViewController!) {
        cropperViewController.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    func imageCropper(cropperViewController: VPImageCropperViewController!, didFinished editedImage: UIImage!) {
        self.BookTitle?.BookCover?.setImage(editedImage, forState: .Normal)
        cropperViewController.dismissViewControllerAnimated(true) { () -> Void in
            
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
        default:
            break
        }
        /**
        判断是否需要在第二行添加小星星
        
        */
        if self.showScore && indexPath.row == 2 {
            cell.contentView.addSubview(self.Score!)
        }
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView?.deselectRowAtIndexPath(indexPath, animated: true)
        
        var row = indexPath.row
        
        if self.showScore && row >= 1 {
            row -= 1
        }
        
        switch row {
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
     *  选择标题
     */
    func tableViewSelectTitle(){
        let vc = Push_TitleViewController()
        GeneralFactory.addTitleWithTitle(vc)
        vc.callBack = ({(Title:String)->Void in
            self.Book_Title = Title
            self.tableView?.reloadData()
        })
        self.presentViewController(vc, animated: true) { () -> Void in
            
        }
        
    }
    /**
     *  选择评分
     */
    func tableViewSelectScore(){
        
        self.tableView?.beginUpdates()
        let tempIndexPath = [NSIndexPath(forRow: 2, inSection: 0)]
        
        if self.showScore{
            self.titleArray.removeAtIndex(2)
            self.tableView?.deleteRowsAtIndexPaths(tempIndexPath, withRowAnimation: .Right)
            self.showScore = false
        }else{
            self.titleArray.insert("", atIndex: 2)
            self.tableView?.insertRowsAtIndexPaths(tempIndexPath, withRowAnimation: .Left)
            self.showScore = true
        }
        
        self.tableView?.endUpdates()
        
    }
    /**
     *  选择分类
     */
    func tableViewSelectType(){
        let vc = Push_TypeViewController()
        GeneralFactory.addTitleWithTitle(vc)
        
        let btn1 = vc.view.viewWithTag(1234) as? UIButton
        let btn2 = vc.view.viewWithTag(1235) as? UIButton
        
        btn1?.setTitleColor(RGB(38, g: 82, b: 67), forState: .Normal)
        btn2?.setTitleColor(RGB(38, g: 82, b: 67), forState: .Normal)
        
        self.presentViewController(vc, animated: true) { () -> Void in
            
        }
        
    }
    /**
     *  选择书评
     */
    func tableViewSelectDescription(){
        let vc = Push_DescriptionViewController()
        GeneralFactory.addTitleWithTitle(vc)
        self.presentViewController(vc, animated: true) { () -> Void in
        }
        
    }
    
}



















