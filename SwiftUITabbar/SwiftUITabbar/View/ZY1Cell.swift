//
//  ZY1Cell.swift
//  SwiftUITabbar
//
//  Created by yrtt on 16/12/30.
//  Copyright © 2016年 ZhangYing. All rights reserved.
//

import UIKit

class ZY1Cell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
