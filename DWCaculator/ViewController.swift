//
//  ViewController.swift
//  DWCaculator
//
//  Created by Dwyane on 2017/11/10.
//  Copyright © 2017年 DWade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let board = DWBoard()
        board.frame = CGRect(x: 0, y: self.view.frame.size.height*0.35, width: self.view.frame.size.width, height: self.view.frame.size.height*0.65)
        self.view.addSubview(board);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

