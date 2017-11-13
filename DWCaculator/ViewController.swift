//
//  ViewController.swift
//  DWCaculator
//
//  Created by Dwyane on 2017/11/10.
//  Copyright © 2017年 DWade. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DWBoardButtonInputDelegate {
    func boardButtonClick(content: String) {
        if content == "AC" || content == "DEL" || content == "=" {
            //进行逻辑处理
            screen.refreshHistory()
        }else {
            screen.inputContent(content:content)
        }
    }
    

    let board = DWBoard()
    let screen = DWScreen()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let board = DWBoard()
//        board.frame = CGRect(x: 0, y: self.view.frame.size.height*0.35, width: self.view.frame.size.width, height: self.view.frame.size.height*0.65)
//        self.view.addSubview(board);
        
        setupUI()
    }
    
    func setupUI() {
        self.view.addSubview(board)
        //设置代理
        board.delegate = self
        board.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(board.superview!.snp.height).multipliedBy(2/3.0)
        }
        
        self.view.addSubview(screen)
        screen.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(board.snp.top)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

