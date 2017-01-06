//
//  ZYRootViewController.swift
//  SwiftUITabbar
//
//  Created by yrtt on 16/12/30.
//  Copyright © 2016年 ZhangYing. All rights reserved.
//

import UIKit

class ZYRootViewController: UIViewController {

    var contentLineImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        navigationControllerConfig()
    }
    
    ///***************************** 导航栏 的处理 ********************************///
    func navigationControllerConfig() {
        // 右侧 barbutton
        self.navigationItem.rightBarButtonItem = UIBarButtonItem .init(title: "右钮", style: .done, target: self, action: #selector(barButtonClick(send:)))
        
        // 导航栏 title 颜色
        self.navigationController?.navigationBar .titleTextAttributes = [NSForegroundColorAttributeName:UIColor.red]
        
        // 导航 文字 颜色
        //        UINavigationBar.appearance() .tintColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        // 导航返回 隐藏文字 只显示箭头
        self.navigationItem.backBarButtonItem = UIBarButtonItem (title: "", style: .plain, target: nil, action: nil)
        
        // 隐藏导航栏 （透明）
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(named: ""), for: .compact)
//        contentLineImageView = findLineImageViewUnder(view: (self.navigationController?.navigationBar)!)
//        contentLineImageView?.isHidden = true
    }
    func findLineImageViewUnder(view:UIView) -> UIImageView {
        if view .isKind(of: UIImageView.self) && view.bounds.size.height < 1.0 {
            return view as! UIImageView
        }
        for subView in view.subviews {
            let imageView = findLineImageViewUnder(view: subView)
            if imageView != NSNull() {
                return imageView
            }
        }
        return view as! UIImageView
    }
    
    func barButtonClick(send:UIBarButtonItem) {
        self .present(ZYOneViewController(), animated: true, completion: nil)
    }
    
    func click(barbutton:UIBarButtonItem) {
        self.navigationController?.pushViewController(ZYOneViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
