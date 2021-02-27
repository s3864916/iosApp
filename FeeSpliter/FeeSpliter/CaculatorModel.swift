//
//  CaculationModel.swift
//  FeeSpliter
//
//  Created by 紀詠恩 on 2020/12/16.
//

import Foundation


struct caculatorMode {
    enum caculatorMode {
        case add
        case subtract
        case mutiply
        case divide
    }
    func caculate(orperattion: caculatorMode) -> String{
        switch orperattion {
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .mutiply:
            return "*"
        case .divide:
            return "/"
        }
    }
}
