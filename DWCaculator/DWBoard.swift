//
//  DWBoard.swift
//  DWCaculator
//
//  Created by Dwyane on 2017/11/10.
//  Copyright © 2017年 DWade. All rights reserved.
//

import UIKit
import SnapKit

protocol DWBoardButtonInputDelegate {
    func boardButtonClick(content:String)
}


class DWBoard: UIView {
    var delegate:DWBoardButtonInputDelegate?
    //用于存放操作面板上所有功能按钮的标题
    var dataArray = ["0", ".", "%", "="
                    , "1", "2", "3", "+"
                    , "4", "5", "6", "-"
                    , "7", "8", "9", "*"
                     , "AC", "DEL", "^", "/"]
    //重写父类的构造方法，在其中进行界面的加载操作：
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //对界面进行布局
    func setupUI() {
        //创建一个变量 用于保存当前布局按钮的上一个按钮
        var frontBtn: DWFuncButton!
        //进行功能按钮的循环创建
        for index in 0..<20 {
            //创建一个功能按钮
            let btn = DWFuncButton()
            self.addSubview(btn)
            //约束
            btn.snp.makeConstraints({ (make) in
                //当按钮每一行的第一个时，将其靠左侧摆放
                if index%4 == 0 {
                    make.left.equalTo(0)
                }else { //否则将按钮的左边考上一个右侧进行摆放
                    make.left.equalTo(frontBtn.snp.right)
                }
                //当按钮为第一行，将其靠父视图底部摆放
                if index/4 == 0 {
                    make.bottom.equalTo(0)
                }else if index%4 == 0 { //当按钮不在第一行且为每行的第一个时，将其底部与上一个按钮的顶部对齐
                    make.bottom.equalTo(frontBtn.snp.top)
                    //否则将其底部与上一个按钮底部对齐整
                }else {
                    make.bottom.equalTo(frontBtn.snp.bottom)
                }
                //约束宽度为父视图宽度的0.25倍
                make.width.equalTo(btn.superview!.snp.width).multipliedBy(0.25)
                //约束高度为父视图宽度的0.2倍
                make.height.equalTo(btn.superview!.snp.height).multipliedBy(0.2)
            })
            
            //设置tag值
            btn.tag = index + 100
            //添加点击事件
            btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
            //设置标题
            btn.setTitle(dataArray[index], for: .normal)
            //对上一个按钮更新保存
            frontBtn = btn
        }
        
    }
    
    @objc func btnClick(_ button:DWFuncButton) {
//        print(button.currentTitle!)
        if delegate != nil {
            //通过协议方法将值传递出去
            delegate?.boardButtonClick(content: button.currentTitle!)
        }
    }
    
}
