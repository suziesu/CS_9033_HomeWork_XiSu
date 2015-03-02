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
    var playerNumber:Int = 2
    class var sharedInstance: SingletonA {
        struct Static{
            static let instance: SingletonA = SingletonA()
        }
        return Static.instance
    }
}