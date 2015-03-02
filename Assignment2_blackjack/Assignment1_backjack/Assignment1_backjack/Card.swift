//
//  Card.swift
//  Assignment1_backjack
//
//  Created by xi su on 2/28/15.
//  Copyright (c) 2015 xi su. All rights reserved.
//

import Foundation
enum Rank: Int{
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack, Queen, King
    func simpleDescription()->String{
        switch self{
        case .Ace:
            return "Ace"
        case .Jack:
            return "Jack"
        case .Queen:
            return "Queen"
        case .King:
            return "King"
        default:
            return String(self.rawValue)
        }
        
    }
    
}
enum Suit:Int{
    case Spade,Heart, Diamond, Club
    func simpleDescription()->String{
        switch self{
        case .Spade:
            return "♠"
        case .Heart:
            return "♥"
        case .Diamond:
            return "♦"
        case .Club:
            return "♣"
            
        }
    }
}

struct Card {
    var rank: Rank
    var suit: Suit
    //    init(rank: Rank,suit: Suit){
    //        self.rank = rank
    //        self.suit = suit
    //    }
    func simpleDescription()->String{
        return "\(rank.simpleDescription())\(suit.simpleDescription())"
    }
}

