//
//  Deck.swift
//  Assignment1_backjack
//
//  Created by xi su on 2/28/15.
//  Copyright (c) 2015 xi su. All rights reserved.
//

import Foundation
class Deck {
    var deck :[Card] = []
    var numOfDeck:Int
    init(numOfDeck:Int){
        self.numOfDeck = numOfDeck
        var indexOfSuit = 0
        var indexOfRank = 1
        for index in 1...numOfDeck {
            for indexOfSuit = 0; indexOfSuit < 4; indexOfSuit += 1 {
                for indexOfRank = 1; indexOfRank < 14; indexOfRank += 1{
                    let suit = Suit(rawValue:indexOfSuit)!
                    let rank = Rank(rawValue: indexOfRank)!
                    var card = Card(rank:rank, suit:suit)
                    self.deck.append(card)
                }
                
            }
        }
        
        
    }
    func shuffleDeck(){
        var array = self.deck
        for i in 0..<(array.count - 1) {
            let j = Int(arc4random_uniform(UInt32(array.count)))
            swap(&array[i], &array[j])
        }
        self.deck = array
        
    }
    func dealCard()->Card{
        
        return deck.removeAtIndex(0)
        
    }
}