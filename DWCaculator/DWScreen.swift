//
//  DWScreen.swift
//  DWCaculator
//
//  Created by Dwyane on 2017/11/10.
//  Copyright © 2017年 DWade. All rights reserved.
//

import UIKit

class DWScreen: UIView {

    var inputLabel:UILabel?
    //for test
    //用于显示历史记录信息
    var historyLabel:UILabel?
    //用户输入表达式或者计算结果字符串
    var inputString = ""
    //历史表达式字符串
    var historyString = ""
    //所有数字字符 用于进行检测匹配
    let figureArray:Array<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
    //所有运算功能字符 用于进行检测匹配
    let funcArray = ["+", "-", "*", "/", "^"]
    init() {
        super.init(frame: CGRect.zero)
        inputLabel = UILabel()
        historyLabel = UILabel()
        setupUI()
    }
    
    func setupUI() {
        //设置文字的对其方式为右对齐
        inputLabel?.textAlignment = .right
        historyLabel?.textAlignment = .right
        //设置字体
        inputLabel?.font = UIFont.systemFont(ofSize: 34)
        historyLabel?.font = UIFont.systemFont(ofSize: 30)
        //设置文字颜色
        inputLabel?.textColor = UIColor.orange
        historyLabel?.textColor = UIColor.black
        //设置文字大小根据字数进行适配
        inputLabel?.adjustsFontSizeToFitWidth = true
        inputLabel?.minimumScaleFactor = 0.5  //最小字体为当前字体的一半
        historyLabel?.adjustsFontSizeToFitWidth = true
        historyLabel?.minimumScaleFactor = 0.5
        //设置文字的截断方式
        inputLabel?.lineBreakMode = .byTruncatingHead
        historyLabel?.lineBreakMode = .byTruncatingHead
        //设置文字的行数
        inputLabel?.numberOfLines = 0
        historyLabel?.numberOfLines = 0
        
        self.addSubview(inputLabel!)
        self.addSubview(historyLabel!)
        //进行自动布局
        inputLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        make.height.equalTo(inputLabel!.superview!.snp.height).multipliedBy(0.5).offset(-10)
        })
        historyLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(10)
            make.height.equalTo(inputLabel!.superview!.snp.height).multipliedBy(0.5).offset(-10)
        })
    }
    
    //提供一个输入信息的接口
    func inputContent(content:String) {
        inputString.append(content)
        inputLabel?.text = inputString
    }
    
    //提供一个刷新历史记录的方法
    func refreshHistory() {
        historyString = inputString
        historyLabel?.text = historyString
    }
    
    //清空显示屏当前输入的信息
    func clearContent() {
        inputString = ""
        inputLabel?.text = inputString
    }
    
    //删除显示屏中上次输入的字符
    func deleteInput() {
        if inputString.characters.count>0 {
            inputString.remove(at: inputString.index(before: inputString.endIndex))
            inputLabel?.text = inputString
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
