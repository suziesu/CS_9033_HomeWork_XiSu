//
//  Player.swift
//  Assignment1_backjack
//
//  Created by xi su on 2/28/15.
//  Copyright (c) 2015 xi su. All rights reserved.
//

import Foundation
class Player {
    var name:String
    var money:Int = 100
    var hands:[Hand] = []
    init(name:String){
        self.name = name
    }
    func appendHand(hand:Hand){
        hands.append(hand)
    }
    
}