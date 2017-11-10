//
//  DWFuncButton.swift
//  DWCaculator
//
//  Created by Dwyane on 2017/11/10.
//  Copyright © 2017年 DWade. All rights reserved.
//

import UIKit

class DWFuncButton: UIButton {

    init() {
        super.init(frame: CGRect.zero)
        //为按钮添加边框
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1).cgColor
        //设置字体与字体颜色
        self.setTitleColor(UIColor.orange, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        self.setTitleColor(UIColor.black, for: .highlighted)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
