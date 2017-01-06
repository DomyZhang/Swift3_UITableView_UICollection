//
//  ZHYImageChache.swift
//  SwiftUITabbar
//
//  Created by yrtt on 17/1/5.
//  Copyright © 2017年 ZhangYing. All rights reserved.
//

import UIKit
import Foundation

class ZHYImageChache: NSObject {

    // 读缓存
    class func readCacheFromPath(url:String) -> NSData {
        var data = NSData.init()
        let path = getFullPathWithUrl(url: url)
        
        if FileManager.default.fileExists(atPath: path) {
            do {
                data = try NSData.init(contentsOfFile: path)
            } catch  {
                print(error)
            }
        }
        return data as NSData
    }
    
    // 写缓存
    class func writeCacheToUrl(url:String, data:NSData) {
        let path = getFullPathWithUrl(url: url)
        FileManager.default.createFile(atPath: path, contents: data as Data, attributes: nil)
        data.write(toFile: path, atomically: true)
    }
    
    // 拼路径
    class func getFullPathWithUrl(url:String) -> String {
        let cachePath = NSHomeDirectory() + "/Library/Caches/ZYImageCache/"+url
        let fileManager =  FileManager.default
        if !fileManager.fileExists(atPath: cachePath, isDirectory: nil) {
            // 文件夹 路径不存在，创建
            do {
                try fileManager.createDirectory(atPath: cachePath, withIntermediateDirectories: true, attributes: nil)
            } catch  {
               print(error)
            }
        }
        // 文件路径
        let cacheFile = cachePath+"/image"
        return cacheFile
    }

}
