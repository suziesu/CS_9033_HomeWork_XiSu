//
//  SingletonA.swift
//  Assignment1_backjack
//
//  Created by xi su on 3/1/15.
//  Copyright (c) 2015 xi su. All rights reserved.
//

import Foundation
class SingletonA {
    var deckNumber:Int = 3
    //hardarray i start from 4
    // "H" mean hit
    // "S" means stand
//    //softarray i start from 12
//    let hardArray = [
//        ["H","H","H","H","H","H","H","H","H","H"],
//        ["H","H","H","H","H","H","H","H","H","H"],
//        ["H","H","H","H","H","H","H","H","H","H"],
//        ["H","H","H","H","H","H","H","H","H","H"],
//        ["H","H","H","H","H","H","H","H","H","H"],
//        ["H","H","H","H","H","H","H","H","H","H"],
//        ["H","H","H","H","H","H","H","H","H","H"],
//        ["H","H","H","H","H","H","H","H","H","H"],
//        ["H","H","H","S","S","S","H","H","H","H"],
//        ["H","S","S","S","S","S","H","H","H","H"],
//        ["H","S","S","S","S","S","H","H","H","H"],
//        ["H","S","S","S","S","S","H","H","H","H"],
//        ["H","S","S","S","S","S","H","H","H","H"],
//        ["S","S","S","S","S","S","S","S","S","S"],
//        ["S","S","S","S","S","S","S","S","S","S"],
//        ["S","S","S","S","S","S","S","S","S","S"],
//        ["S","S","S","S","S","S","S","S","S","S"],
//        ["S","S","S","S","S","S","S","S","S","S"]
//    
//    ]
//    let softArray = [
//        ["H","H","H","H","H","H","H","H","H","H"],
//        ["H","H","H","H","H","H","H","H","H","H"],
//        ["H","H","H","H","H","H","H","H","H","H"],
//        ["H","H","H","H","H","H","H","H","H","H"],
//        ["H","H","H","H","H","H","H","H","H","H"],
//        ["H","H","H","H","H","H","H","H","H","H"],
//        ["H","S","S","S","S","S","S","S","H","H"],
//        ["S","S","S","S","S","S","S","S","S","S"],
//        ["S","S","S","S","S","S","S","S","S","S"],
//        ["S","S","S","S","S","S","S","S","S","S"]
//        
//    ]
    class var sharedInstance: SingletonA {
        struct Static{
            static let instance: SingletonA = SingletonA()
        }
        return Static.instance
    }
}