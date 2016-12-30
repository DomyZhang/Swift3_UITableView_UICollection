//
//  ZY2ViewController.swift
//  SwiftUITabbar
//
//  Created by yrtt on 16/12/30.
//  Copyright © 2016年 ZhangYing. All rights reserved.
//

import UIKit

let SYSTEM_CELL = "SYSTEMCELL"


class ZY2ViewController: ZYRootViewController ,UITableViewDelegate, UITableViewDataSource {

    var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "tableViewSystem"
        initTbaleView()
    }
    func initTbaleView() {
        tableView = UITableView.init(frame: self.view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        self.view .addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    // MARK: - tableView delegate datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: SYSTEM_CELL)
        if cell == nil {
            // subtitle 显示副标题
            cell = UITableViewCell.init(style: .default, reuseIdentifier: SYSTEM_CELL)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            // checkmark   // detailButton  // disclosureIndicator 
            cell?.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
        }
        cell?.textLabel?.text = "系统cell"
        cell?.imageView?.image = UIImage.init(named: "tabbarMy_img")
        cell?.detailTextLabel?.text = "副标题hahaha"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("系统cell \(indexPath.row)被点击")
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
