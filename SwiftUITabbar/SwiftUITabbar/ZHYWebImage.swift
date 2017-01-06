//
//  ZHYWebImage.swift
//  SwiftUITabbar
//
//  Created by yrtt on 17/1/5.
//  Copyright © 2017年 ZhangYing. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImage(strUrl:String,placeholder:String) {
        var zyImage : UIImage?
        
        if strUrl == "" && placeholder == "" {
            return
        }
        
        if placeholder != "" && (self.image == nil) {
            DispatchQueue.main.async(execute: {
                //刷新主UI
                self.image = UIImage(named: placeholder)
            })
        }
        
        DispatchQueue.global().async {
            // 判断string是否是URL
            var imageUrl = ""
            if (strUrl .hasPrefix("http://")) || (strUrl .hasPrefix("https://")) {
                imageUrl = strUrl
            }else {
                imageUrl = Service + strUrl
            }
            // 从缓存取数据
            let cacheData = ZHYImageChache.readCacheFromPath(url: imageUrl)
            if cacheData.length != 0 {
                zyImage = UIImage(data: cacheData as Data)
                self.image = zyImage
            }else {
               // 无缓存 则
                let url = NSURL.init(string: imageUrl)
                let data = NSData.init(contentsOf: url! as URL)//.init(contentsOf: url!)
                if data != nil {
                    zyImage = UIImage(data:data as! Data)
                    ZHYImageChache.writeCacheToUrl(url: imageUrl, data: data!)
                    DispatchQueue.main.async(execute: {
                        self.image = zyImage
                    })
                }
                
            }
        }
    
    }
}

