//
//  DWCalculatorEngine.swift
//  DWCaculator
//
//  Created by Dwyane on 2017/11/13.
//  Copyright © 2017年 DWade. All rights reserved.
//

import UIKit

class DWCalculatorEngine: NSObject {
    //运算符集合
    let funcArray:CharacterSet = ["+", "-", "*", "/", "^", "%"]
    func calculatEquation(equation:String)->Double {
        //以运算符进行分割获取到所有数字
        let elementArray = equation.components(separatedBy: funcArray)
        //设置一个运算标记游标
        var tip = 0
        //运算结果
        var result:Double = Double(elementArray[0])!
        //遍历计算表达式
        for char in equation.characters {
            switch char {
                //进行加法运算
            case "+":
                tip += 1
                if elementArray.count>tip {
                    result += Double(elementArray[tip])!
                }
                //进行减法运算
            case "-":
                tip += 1
                if elementArray.count>tip {
                    result -= Double(elementArray[tip])!
                }
            case "*":
                tip += 1
                if elementArray.count>tip {
                    result *= Double(elementArray[tip])!
                }
                //进行除法运算
            case "/":
                tip += 1
                if elementArray.count>tip {
                    result /= Double(elementArray[tip])!
                }
                //进行取余运算
            case "%":
                tip += 1
                if elementArray.count>tip {
                    result = Double(Int(result)%Int(elementArray[tip])!)
                }
                //进行指数运算
            case "^":
                tip += 1
                if elementArray.count>tip {
                    let tmp = result
                    for _ in 1..<Int(elementArray[tip])! {
                        result *= tmp
                    }
                }
            default:
                break
            }
        }
        return result
    }
}
