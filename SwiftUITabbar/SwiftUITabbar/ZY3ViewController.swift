//
//  ZY3ViewController.swift
//  SwiftUITabbar
//
//  Created by yrtt on 16/12/30.
//  Copyright © 2016年 ZhangYing. All rights reserved.
//

import UIKit

let kSCREENWIDTH = UIScreen.main.bounds.size.width
let kSCREENHEIGHT = UIScreen.main.bounds.size.height

let COLLECTION_CELL = "collectionCell"


class ZY3ViewController: ZYRootViewController ,UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {

    var collectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "collectionView"
        initCollectionView()

    }
    
    func initCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:(kSCREENWIDTH-20)/2,height:150)
        layout.sectionInset = UIEdgeInsetsMake(5, 7, 5, 7)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 1
        
        collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        self.view .addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: COLLECTION_CELL)
//        collectionView.regi
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    // MARK: - collectionView delegate dataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: COLLECTION_CELL, for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item \(indexPath.item) 被点击")
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
