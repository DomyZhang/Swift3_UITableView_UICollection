//
//  ZYOneViewController.swift
//  SwiftUITabbar
//
//  Created by yrtt on 16/12/30.
//  Copyright © 2016年 ZhangYing. All rights reserved.
//

import UIKit

class ZYOneViewController: ZYRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let button = UIButton(type:.system)
        button.frame = CGRect(x:100,y:100,width:100,height:50)
        button .setTitle("返回", for: .normal)
        button .addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
        self.view .addSubview(button)
    }
    
    ///************************ UIViewController 间 跳转 **********************///
    func buttonClick(sender:UIButton) {
        if (self.presentingViewController != nil) {
            // dismiss
            self.dismiss(animated: true, completion: nil)
        }else {
            // pop
            self.navigationController?.popToRootViewController(animated: true)
        }
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
