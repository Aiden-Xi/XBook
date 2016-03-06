//
//  PhotoPickerViewController.swift
//  XBook
//
//  Created by xxy on 16/3/4.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

import UIKit

protocol PhotoPickerDelegate {
    func getImageFromPicker(image: UIImage)
}


class PhotoPickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var alert:UIAlertController?
    var picker:UIImagePickerController!
    var delegate:PhotoPickerDelegate!

    init() {
        super.init(nibName: nil, bundle: nil)
        // 当pickViewController出来的时候是透明的， 但是可以看到下一层的视图
        self.modalPresentationStyle = .OverFullScreen
        
        self.view.backgroundColor = kColorClear
        
        self.picker = UIImagePickerController()
        self.picker?.allowsEditing = true
        self.picker?.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        if (self.alert == nil) {
            self.alert = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
            
            self.alert?.addAction(UIAlertAction(title: "从相册选择", style: .Default, handler: { (action) -> Void in
                self.localPhoto()
            }))
            self.alert?.addAction(UIAlertAction(title: "打开相机", style: .Default, handler: { (action) -> Void in
                self.takePhoto()
            }))
            self.alert?.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: { (action) -> Void in
                
            }))
            
            self.presentViewController(self.alert!, animated: true, completion: { () -> Void in
                
            })
        }
    }
    
    /**
    打开相机
    */
    func takePhoto() {
        // 判断是否有照相机功能
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            // 打开相机， 设置类型为相机
            self.picker?.sourceType = .Camera
            self.presentViewController(self.picker, animated: true, completion: { () -> Void in
                
            })
        } else {
            let alertView = UIAlertController(title: "此机型无相机", message: nil, preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "关闭", style: .Cancel, handler: { (action) -> Void in
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                    
                })
            }))
            
            self.presentViewController(alertView, animated: true, completion: { () -> Void in
                
            })
        }
    }
    
    /**
    *  打开相册
    */
    func localPhoto() {
        self.picker?.sourceType = .PhotoLibrary
        self.presentViewController(self.picker, animated: true) { () -> Void in
            
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.picker?.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        self.picker.dismissViewControllerAnimated(true) { () -> Void in
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                self.delegate.getImageFromPicker(image)
            })
        }
        
        
        
        
    }
    










}
