//
//  ZY1ViewController.swift
//  SwiftUITabbar
//
//  Created by yrtt on 16/12/30.
//  Copyright © 2016年 ZhangYing. All rights reserved.
//

import UIKit

let IDENTIFIERCELL = "identifierCell"// cell 标识符


class ZY1ViewController: ZYRootViewController ,UITableViewDelegate, UITableViewDataSource {

    var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "tableViewCustom"
        
        initTableView()
    }
    
    func initTableView() {
        tableView = UITableView.init(frame: self.view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        self.view .addSubview(tableView)
        tableView.register(UINib.init(nibName: "ZY1Cell", bundle: nil), forCellReuseIdentifier: IDENTIFIERCELL)//register(ZY1Cell.self, forCellReuseIdentifier: IDENTIFIERCELL)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:-
    // MARK: tableView delegate datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIERCELL) as! ZY1Cell
        cell.iconImageView.image = UIImage.init(named: "tabbarMy_img")
        cell.titleLabel.text = "title"
        cell.contentLabel.text = "自定义cell content,content,content,content"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("自定义cell \(indexPath.row)被点击")
        self.navigationController?.pushViewController(ZYOneViewController(), animated: true)
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
