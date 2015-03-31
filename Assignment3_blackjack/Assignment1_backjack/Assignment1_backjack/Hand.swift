//
//  Hand.swift
//  Assignment1_backjack
//
//  Created by xi su on 2/28/15.
//  Copyright (c) 2015 xi su. All rights reserved.
//

import Foundation
class Hand{
    var handArray:[Card]
    var bet:Int = 1
    var value:Int{
        get{
            var handValue = 0;
            for card in handArray{
                var value = card.rank.rawValue
                if(value > 10){
                    value = 10
                }
                handValue += value
                
                
            }
            for card in handArray {
                if(card.rank.rawValue == 1 && handValue + 10 <= 21){
                    handValue += 10
                }
            }
            return handValue
        }
    }
    var hardValue:Int{
        get{
            var hardValue = 0;
            for card in handArray{
                var value = card.rank.rawValue
                if(value > 10){
                    value = 10
                }
                hardValue += value
                
                
            }
            return hardValue
        }
    }
    init(bet:Int){
        handArray = []
        self.bet = bet
    }
    func appendCard(card:Card){
        handArray.append(card)
    }
//    func getValue()->Int{
//        
//        
//    }
    
    
}