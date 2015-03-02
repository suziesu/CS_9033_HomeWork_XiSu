//
//  PlayerViewController.swift
//  Assignment1_backjack
//
//  Created by xi su on 2/28/15.
//  Copyright (c) 2015 xi su. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    
    
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var dealButton: UIButton!
    @IBOutlet weak var standButton: UIButton!
    
    @IBOutlet weak var scoreLabel1: UILabel!
    @IBOutlet weak var scoreLabel2: UILabel!
    @IBOutlet weak var scoreLabel3: UILabel!
    @IBOutlet weak var scoreLabel4: UILabel!
    @IBOutlet weak var scoreLabel5: UILabel!
    @IBOutlet weak var scoreLabel6: UILabel!
    var scoreLabels:[UILabel!]{
        return [scoreLabel1,scoreLabel2,scoreLabel3,scoreLabel4,scoreLabel5,scoreLabel6]
    }
    
    @IBOutlet weak var totalScore1: UILabel!
    @IBOutlet weak var totalScore2: UILabel!
    @IBOutlet weak var totalScore3: UILabel!
    @IBOutlet weak var totalScore4: UILabel!
    @IBOutlet weak var totalScore5: UILabel!
    @IBOutlet weak var totalScore6: UILabel!
    var totalScores:[UILabel!]{
        return [totalScore1,totalScore2,totalScore3,totalScore4,totalScore5,totalScore6]
    }
    @IBOutlet weak var dealerLabel: UILabel!
    @IBOutlet weak var dealerHand1: UILabel!
    @IBOutlet weak var dealerHand2: UILabel!
    
//    @IBOutlet weak var player: UILabel!
//    @IBOutlet weak var betScore: UITextField!
    @IBOutlet weak var hitOrStand: UILabel!
    
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player2: UILabel!
    @IBOutlet weak var player3: UILabel!
    @IBOutlet weak var player4: UILabel!
    @IBOutlet weak var player5: UILabel!
    @IBOutlet weak var player6: UILabel!
    var playersLabel: [UILabel!] {
        return [player1, player2, player3, player4, player5, player6]
    }
    @IBOutlet weak var player1Hand1: UILabel!
    @IBOutlet weak var player1Hand2: UILabel!
    @IBOutlet weak var player2Hand1: UILabel!
    @IBOutlet weak var player2Hand2: UILabel!
    @IBOutlet weak var player3Hand1: UILabel!
    @IBOutlet weak var player3Hand2: UILabel!
    @IBOutlet weak var player4Hand1: UILabel!
    @IBOutlet weak var player4Hand2: UILabel!
    @IBOutlet weak var player5Hand1: UILabel!
    @IBOutlet weak var player5Hand2: UILabel!
    @IBOutlet weak var player6Hand1: UILabel!
    @IBOutlet weak var player6Hand2: UILabel!
    var playersHands:[[UILabel!]]{
        return [[player1Hand1,player1Hand2],[player2Hand1,player2Hand2],[player3Hand1,player3Hand2],[player4Hand1,player4Hand2],[player5Hand1,player5Hand2],[player6Hand1,player6Hand2]]
    }
    
    @IBOutlet weak var dollarSign1: UILabel!
    @IBOutlet weak var dollarSign2: UILabel!
    @IBOutlet weak var dollarSign3: UILabel!
    @IBOutlet weak var dollarSign4: UILabel!
    @IBOutlet weak var dollarSign5: UILabel!
    @IBOutlet weak var dollarSign6: UILabel!
    var dollarSigns:[UILabel!]{
        return [dollarSign1,dollarSign2,dollarSign3,dollarSign4,dollarSign5,dollarSign6]
    }
    
    @IBOutlet weak var betText1: UITextField!
    @IBOutlet weak var betText2: UITextField!
    @IBOutlet weak var betText3: UITextField!
    @IBOutlet weak var betText4: UITextField!
    @IBOutlet weak var betText5: UITextField!
    @IBOutlet weak var betText6: UITextField!
    var betTexts:[UITextField!]{
        return [betText1,betText2,betText3,betText4,betText5,betText6]
    }
    
    @IBOutlet weak var pointer1: UILabel!
    @IBOutlet weak var pointer2: UILabel!
    @IBOutlet weak var pointer3: UILabel!
    @IBOutlet weak var pointer4: UILabel!
    @IBOutlet weak var pointer5: UILabel!
    @IBOutlet weak var pointer6: UILabel!
    var pointers: [UILabel!]{
        return [pointer1,pointer2,pointer3,pointer4,pointer5,pointer6]
    }
    
    
    @IBOutlet weak var betLabel: UIButton!
    
    @IBOutlet weak var playerInPlay: UILabel!
    var playerIndex:Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
//        startWithEmpty
        
        startNewRound()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var shareData : SingletonA = SingletonA.sharedInstance
    
    var deckNumber:Int = 3
    var playerNumber:Int = 2
    var score:Int = 100
    var betValue:Int = 0
    var inPlay = false
    
    var count = 5
    var loadNewGame = true;
    
    var players:[Player] = []
    var dealer:Player = Player(name: "")
    var deckObj:Deck = Deck(numOfDeck: 3)
    var blackJackIndex: [Bool]=[]
    var out:[Bool] = []
    
    func initial(){
        blackJackIndex = []
        for index in 0...(playerNumber-1){
            
            blackJackIndex.append(false)
            pointers[index].hidden = true
        }
        
        playerIndex = -1
        hitButton.hidden = true
        standButton.hidden = true
        
        
    }
    func startNewRound(){
        out = []
        initial()
        for index in 0...5 {
            pointers[index].hidden = true
            dollarSigns[index].hidden = true
            playersLabel[index].text = ""
            betTexts[index].hidden = true
            playersHands[index][0].text = ""
            playersHands[index][1].text = ""
            scoreLabels[index].hidden = true
            totalScores[index].hidden = true
            
        }
        for index in 0...(playerNumber-1) {
            
            out.append(false)
            playersLabel[index].text = "Player \(index + 1)"
            let player = Player(name: "Player \(index + 1)")
            player.money = 100
            players.append(player)
            playersLabel[index].textColor = UIColor.blueColor()
            scoreLabels[index].hidden = false
            totalScores[index].hidden = false
            totalScores[index].text = String(players[index].money)
            
        }
        dealerLabel.textColor = UIColor.blueColor()
        dealerHand1.text = ""
        dealerHand2.text = ""
        loadNewGame = true
        count = 5
        dealButton.hidden = false
        betLabel.hidden = true

        hitOrStand.hidden = true
 
        deckObj = Deck(numOfDeck:deckNumber)
        deckObj.shuffleDeck()
        loadNewGame = false
    }
    @IBAction func deal(sender: UIButton) {
        
        startDeal()
    }
    func startDeal(){
        initial()
        var deckNumber = shareData.deckNumber
        var playerNumber = shareData.playerNumber
        dealerLabel.textColor = UIColor.grayColor()
        dealerHand1.text = ""
        for index in 0...(playerNumber - 1) {

            playersHands[index][0].text = ""
            playersHands[index][1].text = ""
            playersLabel[index].textColor = UIColor.grayColor()
            totalScores[index].text = String(players[index].money)
            if(out[index] == false){
                dollarSigns[index].hidden = false
                betTexts[index].hidden = false
                if players[index].hands.count > 0 {
                    betTexts[index].text = String(players[index].hands[0].bet)
                    players[index].hands.removeAll(keepCapacity: true)
                }
//
            }else{
                playersHands[index][1].text = "Out of Money"
            }
        }
        playerInPlay.hidden = true
        dealButton.hidden = true
        betLabel.hidden = false
        hitOrStand.hidden = true
        if(count == 0 || loadNewGame || deckObj.deck.count < 30){
            deckObj = Deck(numOfDeck: deckNumber)
            deckObj.shuffleDeck()
            loadNewGame = false
            count = 5
            
        }
        
    }

    @IBAction func afterBet (sender: UIButton) {
//        var deckNumber = shareData.deckNumber
//        var playerNumber = shareData.playerNumber
        let dealerHand:Hand = Hand(bet: 0)
        dealer = Player(name: "Dealer")
        var rightBet = true
        for index in 0...(playerNumber-1) {
            if(out[index]){
                continue
            }
            let betMoney:Int? = betTexts[index].text.toInt()
            
            if betMoney < 1 || betMoney > players[index].money {
                rightBet = false
                let alert = UIAlertController(title: title, message: "\(players[index].name)'s bet must be above 1 and less than your score \(players[index].money)", preferredStyle: .Alert)
                let action = UIAlertAction(title: "Ok", style: .Default, handler: {action in self.startDeal()})
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
                betTexts[index].text = ""
            }
            
        }
        if rightBet {
            for index in 0...(playerNumber - 1) {
                if(out[index]){
                    continue
                }
                let betMoney:Int? = betTexts[index].text.toInt()
                let hand:Hand = Hand(bet:betMoney!)
                players[index].appendHand(hand)
                players[index].money -= betMoney!
            }
            let dHand:Hand = Hand(bet:0)
            dealer.appendHand(dHand)
            startPlayUpdateLabel();
            dealFirstTwoCard();
        }
        
    }
    
    func startPlayUpdateLabel() {
//        var playerNumber = shareData.playerNumber
        dealButton.hidden = true
        hitButton.hidden = false
        standButton.hidden = false
        betLabel.hidden = true
        hitOrStand.hidden = true
        dealerLabel.textColor = UIColor.blueColor()
        
        for index in 0...5 {
            dollarSigns[index].hidden = true
            betTexts[index].hidden = true
        }
        for index in 0...(playerNumber-1) {
            if !out[index] {
                playersLabel[index].textColor = UIColor.blueColor()
                totalScores[index].text = String(players[index].money)
            }else{
                playersLabel[index].textColor = UIColor.grayColor()
            }
            
        }
    }
    
    
    func dealFirstTwoCard(){
        for index in 0...(playerNumber-1){
            if !out[index] {
                let dealCard = deckObj.dealCard()
                players[index].hands[0].appendCard(dealCard)
                playersHands[index][0].text?.extend(dealCard.simpleDescription() + " ")
            }
        }
        let de1 = deckObj.dealCard()
        dealer.hands[0].appendCard(de1)
        dealerHand1.text?.extend(de1.simpleDescription() + " ")
        for index in 0...(playerNumber-1){
            if !out[index] {
                let dealCard2 = deckObj.dealCard()
                players[index].hands[0].appendCard(dealCard2)
                playersHands[index][0].text?.extend(dealCard2.simpleDescription() + " ")
                checkBlackJack(players[index],index:index)
            }
        }
        
        let de2 = deckObj.dealCard()
        dealer.hands[0].appendCard(de2)
        dealerHand1.text?.extend("fold" + " ")
        inPlay = true
        
        continuePlay()
    }
    func checkBlackJack(player:Player,index:Int) {
        if player.hands[0].value == 21{
            blackJackIndex[index] = true
            playersLabel[index].textColor = UIColor.redColor()
            playersHands[index][1].text = "Black Jack"
            
        }
    }
    func continuePlay(){
         playerIndex++
        if(playerIndex > 0){
            pointers[playerIndex - 1].hidden = true
        }
        
        
        if playerIndex < playerNumber {
            
            if blackJackIndex[playerIndex] == true || out[playerIndex] {
                continuePlay()
            }else{
                pointers[playerIndex].hidden = false
                hitOrStand.hidden = false
                hitOrStand.text = "Hit? or Stand?"
                hitButton.hidden = false
                standButton.hidden = false
                playerInPlay.hidden = false
                playerInPlay.text = String(players[playerIndex].name)+" :"
            }
        }
        else{
            playerInPlay.hidden = true
            var currHand = dealer.hands[0].handArray
            dealerHand1.text = currHand[currHand.count - 1].simpleDescription() + "\n"
            
            while dealer.hands[0].value < 17 {
                var dlCard = deckObj.dealCard()
                dealer.hands[0].appendCard(dlCard)
            }
            dealerHand1.text = ""
            for card in dealer.hands[0].handArray {
                dealerHand1.text?.extend(card.simpleDescription() + " ")
            }
            inPlay = false
            countMoney()
            
           
        }
    }
    @IBAction func hit(sender: UIButton) {
        
        hitOrStand.hidden = true
        inPlay = true
        if inPlay && players[playerIndex].hands[0].value < 21{
            let plCard = deckObj.dealCard()
            players[playerIndex].hands[0].appendCard(plCard)
            playersHands[playerIndex][0].text?.extend(plCard.simpleDescription() + " ")
            checkResult(players[playerIndex],index:playerIndex)
        }
        
        
    }
    
    func dealEnd(){
        hitOrStand.hidden = false
        count--
        
        dealButton.hidden = false
        hitButton.hidden = true
        standButton.hidden = true
        
        inPlay = false
        gameOver()
        
    }
    func countMoney(){
        let dealerValue = dealer.hands[0].value
        for index in 0...(playerNumber-1){
            if !out[index] {
                let playerValue = players[index].hands[0].value
                let betValue = players[index].hands[0].bet
                if  dealerValue > 21 {
                    if playerValue > 21 {
                        playersHands[index][1].text = "It is a tie"
                        players[index].money += betValue
                    }else{
                        playersHands[index][1].text = "Congrats! You won \(betValue) score"
                        players[index].money += 2 * betValue
                    }
                    
                }else if dealerValue == 21 {
                    if playerValue == 21 {
                        playersHands[index][1].text = "It is a tie"
                        players[index].money += betValue
                    }else{
                        playersHands[index][1].text = "Sorry, you lose \(betValue) score"
                    }
                }else{
                    if playerValue > 21 {
                         playersHands[index][1].text = "Sorry, you lose \(betValue) score"
                    }else if playerValue > dealerValue {
                        playersHands[index][1].text = "Congrats! You won \(betValue) score"
                        players[index].money += 2 * betValue
                    }else if playerValue == dealerValue {
                        playersHands[index][1].text = "It is a tie"
                        players[index].money += betValue
                    }else {
                        playersHands[index][1].text = "Sorry, you lose \(betValue) score"
                    }
                }
                if players[index].money == 0{
                    out[index] = true
                }
                

            }else{
                continue
            }
        }
        dealEnd()
        

    }
    func checkResult(player:Player,index:Int){
        if inPlay == true && player.hands[0].value == 21 {
            blackJackIndex[index] = true
            playersLabel[index].textColor = UIColor.redColor()
            playersHands[index][1].text = "21 points"
            continuePlay()
            
        }
        else if inPlay == true && player.hands[0].value > 21 {
            playersHands[index][1].text = "Busted"
            continuePlay()
            
        }else{
            hitOrStand.hidden = false 
            hitOrStand.text = "Hit? or Stand"
            hitButton.hidden = false
            standButton.hidden = false
            inPlay = true
        }
    }

    
    @IBAction func stand(sender: UIButton) {
        continuePlay()
    }
    
    func gameOver(){
//        var playerNumber = shareData.playerNumber
        var restPlayer = playerNumber
        for index in 0...(playerNumber-1) {
            if players[index].money == 0{
                restPlayer--
            }
            
        }
        
        if restPlayer == 0{
            
            let alert = UIAlertController(title: title, message: "Sorry! All Players are out! Game Over", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Start A New One", style: .Default, handler: {action in self.gameOverLabelUpdate()})
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
            
        }
    }
    func gameOverLabelUpdate(){
        hitButton.hidden = true
        dealButton.hidden = true
        standButton.hidden = true
        hitOrStand.hidden = true
        dealerLabel.textColor = UIColor.grayColor()
        dealerHand1.text = ""
        playerInPlay.hidden = true
        for index in 0...(playerNumber-1) {
            playersLabel[index].textColor = UIColor.grayColor()
            playersHands[index][0].text = ""
            playersHands[index][1].text = ""
            totalScores[index].hidden = true
            scoreLabels[index].hidden = true
            
        }
        
    }

    
}