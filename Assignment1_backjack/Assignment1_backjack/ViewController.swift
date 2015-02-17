//
//  ViewController.swift
//  Assignment1_backjack
//
//  Created by xi su on 2/15/15.
//  Copyright (c) 2015 xi su. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {
    
    @IBOutlet weak var dealerCard1: UILabel!
    
    @IBOutlet weak var dealerCard2: UILabel!
    @IBOutlet weak var dealerCard3: UILabel!
    @IBOutlet weak var dealerCard4: UILabel!
    @IBOutlet weak var dealerCard5: UILabel!
    @IBOutlet weak var dealerCard6: UILabel!
    
    @IBOutlet weak var playerCard1: UILabel!
    @IBOutlet weak var playerCard2: UILabel!
    @IBOutlet weak var playerCard3: UILabel!
    @IBOutlet weak var playerCard4: UILabel!
    @IBOutlet weak var playerCard5: UILabel!
    @IBOutlet weak var playerCard6: UILabel!
//    dealerCard1.numberOfLines = 2
//    dealerCard2.numberOfLines = 2
//    dealerCard3.numberOfLines = 2
//    dealerCard4.numberOfLines = 2
//    dealerCard5.numberOfLines = 2
//    dealerCard6.numberOfLines = 2
//    
//    playerCard1.numberOfLines = 2
//    playerCard2.numberOfLines = 2
//    playerCard3.numberOfLines = 2
//    playerCard4.numberOfLines = 2
//    playerCard5.numberOfLines = 2
//    playerCard6.numberOfLines = 2
  
    
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var dealButton: UIButton!
    @IBOutlet weak var standButton: UIButton!
    
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var dealer: UILabel!
    @IBOutlet weak var player: UILabel!
    @IBOutlet weak var betScore: UITextField!
    @IBOutlet weak var hitOrStand: UILabel!
    @IBOutlet weak var betLabel: UIButton!
    
    @IBOutlet weak var dollorSign: UILabel!
    

   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var score:Int = 100
    var betValue:Int = 0
        var dealerHand:Hand = Hand()
        var playerHand:Hand = Hand()
    var inPlay = false
    
    var count = 5
    var loadNewGame = true;
    
    
    var deckObj = Deck()

    @IBAction func afterBet (sender: UIButton) {
        let bet:Int? = betScore.text.toInt()
        betValue = bet!
        if betValue < 1 || betValue > score{
            let alert = UIAlertController(title: title, message: "Bet must be above 1 and less than your score", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Ok", style: .Default, handler: {action in self.updateLabels();self.startDeal()})
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
        else{
            afterBet()
            inPlay = false
            dealerHand = Hand()
            playerHand = Hand()
            var pl1 = deckObj.dealCard()
            playerHand.appendCard(pl1)
            playerCard1.text = pl1.simpleDescription() + "\n"
            
            var de1 = deckObj.dealCard()
            dealerHand.appendCard(de1)
            dealerCard1.text = de1.simpleDescription() + "\n"
            
            var pl2 = deckObj.dealCard()
            playerHand.appendCard(pl2)
            playerCard2.text = pl2.simpleDescription() + "\n"
            
            var de2 = deckObj.dealCard()
            dealerHand.appendCard(de2)
            dealerCard2.text = "fold" + "\n"

            inPlay = true
            checkResult()

        }
        
        
    }
    

    @IBAction func deal(sender: UIButton) {
        startDeal()
    }
   
    @IBAction func hit(sender: UIButton) {
        
        hitOrStand.hidden = true
        inPlay = true
        if inPlay && playerHand.getValue() < 21{
            var plCard = deckObj.dealCard()
            playerHand.appendCard(plCard)
            var cardCount = playerHand.handArray.count % 6
            switch cardCount {
            case 1:
                playerCard1.text = playerCard1.text! + plCard.simpleDescription() + "\n"
            case 2:
                playerCard2.text = playerCard2.text! + plCard.simpleDescription() + "\n"
            case 3:
                playerCard3.text = playerCard3.text! + plCard.simpleDescription() + "\n"
            case 4:
                playerCard4.text = playerCard4.text! + plCard.simpleDescription() + "\n"
            case 5:
                playerCard5.text = playerCard5.text! + plCard.simpleDescription() + "\n"
            case 0:
                playerCard6.text = playerCard6.text! + plCard.simpleDescription() + "\n"
            default:
                break
                
                
            }
            checkResult()
            
        }
        
        
    }
    
    @IBAction func stand(sender: UIButton) {
        hitOrStand.hidden = true
        hitButton.hidden = true
        standButton.hidden = true
        
        if inPlay{
            inPlay = false
            var currHand = dealerHand.handArray
            dealerCard2.text = currHand[currHand.count - 1].simpleDescription() + "\n"
            
            while dealerHand.getValue() < 17 {
                var dlCard = deckObj.dealCard()
                dealerHand.appendCard(dlCard)
                var cardCount = dealerHand.handArray.count % 6
                switch cardCount {
                case 1:
                    dealerCard1.text = dealerCard1.text! + dlCard.simpleDescription() + "\n"
                case 2:
                    dealerCard2.text = dealerCard2.text! + dlCard.simpleDescription() + "\n"
                case 3:
                    dealerCard3.text = dealerCard3.text! + dlCard.simpleDescription() + "\n"
                case 4:
                    dealerCard4.text = dealerCard4.text! + dlCard.simpleDescription() + "\n"
                case 5:
                    dealerCard5.text = dealerCard5.text! + dlCard.simpleDescription() + "\n"
                case 0:
                    dealerCard6.text = dealerCard6.text! + dlCard.simpleDescription() + "\n"
                default:
                    break
                    
                    
                }
                
            }
            checkResult()
        }
        
        
    }
    
    func gameOver(){
        if score <= 0{

            let alert = UIAlertController(title: title, message: "Sorry! Game Over", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Start A New One", style: .Default, handler: {action in self.startNewRound(); self.updateLabels()})
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
            
        }
    }
//    func newDeal(){
//        dealButton.hidden = false
//        hitButton.hidden = true
//        standButton.hidden = true
//        dealer.textColor = UIColor.blueColor()
//        player.textColor = UIColor.blueColor()
//        betLabel.hidden = true
//        dollorSign.hidden = true
//        betScore.hidden = true
//        updateLabels()
//        hitOrStand.hidden = true
//        if(count == 0 || loadNewGame){
//            deckObj = Deck()
//            deckObj.shuffleDeck()
//            //            deck = deckObj.deck
//            loadNewGame = false
//            count = 5
//            
//        }
//        
//    }

    func startDeal(){
        dealerCard1.text = ""
        dealerCard2.text = ""
        dealerCard3.text = ""
        dealerCard4.text = ""
        dealerCard5.text = ""
        dealerCard6.text = ""
        playerCard1.text = ""
        playerCard2.text = ""
        playerCard3.text = ""
        playerCard4.text = ""
        playerCard5.text = ""
        playerCard6.text = ""
        dealButton.hidden = true
        hitButton.hidden = true
        standButton.hidden = true
        dealer.textColor = UIColor.grayColor()
        player.textColor = UIColor.grayColor()
        betLabel.hidden = false
        dollorSign.hidden = false
        betScore.hidden = false
        hitOrStand.hidden = true
        if(count == 0 || loadNewGame || deckObj.deck.count < 10){
            deckObj = Deck()
            deckObj.shuffleDeck()
            //            deck = deckObj.deck
            loadNewGame = false
            count = 5
            
        }

        
    }
    
    func afterBet(){
        dealButton.hidden = true
        hitButton.hidden = false
        standButton.hidden = false
        dealer.textColor = UIColor.blueColor()
        player.textColor = UIColor.blueColor()
        betLabel.hidden = true
        dollorSign.hidden = true
        betScore.hidden = true
        hitOrStand.hidden = true
    }
    func startNewRound(){
        score = 100
        loadNewGame = true
        count = 5
        dealButton.hidden = false
        hitButton.hidden = true
        standButton.hidden = true
        dealer.textColor = UIColor.blueColor()
        player.textColor = UIColor.blueColor()
        betLabel.hidden = true
        dollorSign.hidden = true
        betScore.hidden = true
        updateLabels()
        hitOrStand.hidden = true
        
        deckObj = Deck()
        deckObj.shuffleDeck()
        deckObj.shuffleDeck()
        loadNewGame = false
    }
    func updateLabels(){
        totalScore.text = "\(score)"
    }
    func dealEnd(text:String,value:Int){
        hitOrStand.hidden = false
        hitOrStand.text = text
        score += value;
        count--
        
        dealButton.hidden = false
        hitButton.hidden = true
        standButton.hidden = true
        updateLabels()
        inPlay = false
        gameOver()

    }
    func checkResult(){
        if playerHand.getValue() == 21 {
            
            dealEnd("Congratulation!You won \(betValue)score!",value:betValue)

        }
        else if inPlay == true && (dealerHand.getValue() == 21 || playerHand.getValue() > 21) {
            var currHand = dealerHand.handArray
            dealerCard2.text = currHand[currHand.count - 1].simpleDescription() + "\n"
            
            dealEnd("Sorry!You lose \(betValue) score!",value:-betValue)
            
        }else if inPlay == false && (dealerHand.getValue() > 21 || dealerHand.getValue() < playerHand.getValue()){
            dealEnd("Congratulation!You won \(betValue)score!",value:betValue)
        }else if inPlay == false && dealerHand.getValue() == playerHand.getValue(){
            dealEnd("It is a tie!",value:0)
        }else if inPlay == false && dealerHand.getValue() > playerHand.getValue(){
            
            dealEnd("Sorry!You lose \(betValue) score!",value:-betValue)
        }else{
            println("5")

            hitOrStand.hidden = false
            hitOrStand.text = "Hit? or Stand"
            hitButton.hidden = false
            standButton.hidden = false
            inPlay = true
        }
    }
    
}
