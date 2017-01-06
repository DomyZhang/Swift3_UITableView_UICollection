//
//  ZY1ViewController.swift
//  SwiftUITabbar
//
//  Created by yrtt on 16/12/30.
//  Copyright © 2016年 ZhangYing. All rights reserved.
//

import UIKit

import Alamofire
import HandyJSON

let IDENTIFIERCELL = "identifierCell"// cell 标识符


class ZY1ViewController: ZYRootViewController ,UITableViewDelegate, UITableViewDataSource {

    var tableView = UITableView()
    var dataSourceArray = Array<Any>.init()
    var dataSourceJSON = JSON.init(AnyObject.self)
    var dataSourceHandy = Array<Any>.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "tableViewCustom"
        
        initTableView()
        loadData()
    }
    
    func initTableView() {
        tableView = UITableView.init(frame: self.view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        self.view .addSubview(tableView)
        tableView.register(UINib.init(nibName: "ZY1Cell", bundle: nil), forCellReuseIdentifier: IDENTIFIERCELL)//register(ZY1Cell.self, forCellReuseIdentifier: IDENTIFIERCELL)
    }
    
    func loadData() {
        
        let param:Parameters = ["openid":""]
        Alamofire.request(ZYRequestPostOne, parameters:param) .responseJSON { (resp) in
            switch resp.result {
            case .success:
                print("\(resp.result)")
                if let jsonResp = resp.result.value {
                    
                    /********************* one ****************
                     /// 直接解析
                    let jsonToDict = jsonResp as? NSDictionary
                    let data = jsonToDict?.value(forKey: "data")as! NSDictionary
                    let listArr = data["planList"]as! NSArray
                    for dic in listArr {
                        let d = dic as! NSDictionary
                        self.dataSource .append(d)
                    }
                    self.tableView.reloadData()
                    ******************  end one ***************/
                    
                    /********************* two ****************
                    /// SwiftJson
                    let jsonDeal = JSON(jsonResp)
                    let listArr = jsonDeal["data"]["planList"]
                    self.dataSourceJSON = listArr
                    self.tableView.reloadData()
                    ******************* end two ****************/

                    //********************* three ****************
                    /// HandyJSON
                    let data = (jsonResp as AnyObject).value(forKey: "data") as! [String: Any]
                    let listArr = data["planList"] as! [Any]
                    for i in 0..<listArr.count {
                        if let model = JSONDeserializer<ZYModel>.deserializeFrom(dict: listArr[i] as? NSDictionary) {
                            self.dataSourceHandy .append(model)
                        }
                    }
                    self.tableView.reloadData()
                    //****************** end three ****************

                }
 
 
            case .failure(let error):
                    print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:-
    // MARK: tableView delegate datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceHandy.count//self.dataSourceJSON.count//dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIERCELL) as! ZY1Cell
        
        /********************* one ****************
        let data = (self.dataSourceArray as NSArray)[indexPath.row] as! NSDictionary
        /*
        let imageUrl = URL.init(string: Service+(data["images"] as! String))
        let da = NSData(contentsOf: imageUrl!)
         */
        cell.iconImageView.image = UIImage.init(named: "tabbarMy_img") // UIImage(data:da as! Data) 异步请求
        cell.titleLabel.text = data["name"] as? String //"title"
        cell.contentLabel.text = data["brief"] as? String //"自定义cell content,content,content,content"
        ********************  end one ***************/
        
        /********************* two ****************
        let data = self.dataSourceJSON[indexPath.row]
        cell.iconImageView.image = UIImage.init(named: "tabbarMy_img")
        cell.titleLabel.text = data["name"].string
        cell.contentLabel.text = data["brief"].string
        ******************* end two ****************/
        
        //********************* three ****************
        let data = self.dataSourceHandy[indexPath.row] as! ZYModel
        cell.iconImageView .setImage(strUrl: data.images!, placeholder: "tabbarMy_img")//.image = UIImage.init(named: "tabbarMy_img")
        cell.titleLabel.text = data.name
        cell.contentLabel.text = data.brief
        //******************* end three ****************
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
