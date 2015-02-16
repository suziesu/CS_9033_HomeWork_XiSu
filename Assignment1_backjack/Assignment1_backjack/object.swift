//
//  object.swift
//  Assignment1_backjack
//
//  Created by xi su on 2/16/15.
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

class Deck {
    var deck :[Card] = []
    init(){
        var indexOfSuit = 0
        var indexOfRank = 1
        for indexOfSuit = 0; indexOfSuit < 4; indexOfSuit += 1 {
            for indexOfRank = 1; indexOfRank < 14; indexOfRank += 1{
                let suit = Suit(rawValue:indexOfSuit)!
                let rank = Rank(rawValue: indexOfRank)!
                var card = Card(rank:rank, suit:suit)
                self.deck.append(card)
            }

        }

    }
    func shuffleDeck(){
        var array = self.deck
        for i in 0..<(array.count - 1) {
            let j = Int(arc4random_uniform(52))
            swap(&array[i], &array[j])
        }
        self.deck = array

    }
    func dealCard()->Card{
        
        return deck.removeAtIndex(0)
        
    }
}

class Hand{
    var handArray:[Card]
    init(){
        handArray = []
    }
    func appendCard(card:Card){
        handArray.append(card)
    }
    func getValue()->Int{
        var handValue = 0;
        for card in handArray{
            var value = card.rank.rawValue
            if(value > 10){
                value = 10
            }
            handValue += value
            
            
        }
        for card in handArray {
            if(card.rank.simpleDescription() == "Ace" && handValue + 10 <= 21){
                handValue += 10
            }
        }
        return handValue
    }
    

}