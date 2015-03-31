//
//  PlayerViewController.swift
//  Assignment1_backjack
//
//  Created by xi su on 2/28/15.
//  Copyright (c) 2015 xi su. All rights reserved.
//
// Background Image credit to 
// http://www.7sultans.eu/images/540/casino-games/blackjack/multi-hand-european-blackjack-gold.jpg

import UIKit

class PlayerViewController: UIViewController, UITextFieldDelegate {
    //my understanding is that we have dealer and AI and player
    // we control the player compare with AI to see how well the AI did
    //player1 is AI
    //player2 is user
    //hardarray i start from 4
    // "H" mean hit
    // "S" means stand
    //    //softarray i start from 12
    
    let hardArray:[[String]] = [
            ["H","H","H","H","H","H","H","H","H","H"],
            ["H","H","H","H","H","H","H","H","H","H"],
            ["H","H","H","H","H","H","H","H","H","H"],
            ["H","H","H","H","H","H","H","H","H","H"],
            ["H","H","H","H","H","H","H","H","H","H"],
            ["H","H","H","H","H","H","H","H","H","H"],
            ["H","H","H","H","H","H","H","H","H","H"],
            ["H","H","H","H","H","H","H","H","H","H"],
            ["H","H","H","S","S","S","H","H","H","H"],
            ["H","S","S","S","S","S","H","H","H","H"],
            ["H","S","S","S","S","S","H","H","H","H"],
            ["H","S","S","S","S","S","H","H","H","H"],
            ["H","S","S","S","S","S","H","H","H","H"],
            ["S","S","S","S","S","S","S","S","S","S"],
            ["S","S","S","S","S","S","S","S","S","S"],
            ["S","S","S","S","S","S","S","S","S","S"],
            ["S","S","S","S","S","S","S","S","S","S"],
            ["S","S","S","S","S","S","S","S","S","S"]
    
        ]
    let softArray:[[String]] = [
            ["H","H","H","H","H","H","H","H","H","H"],
            ["H","H","H","H","H","H","H","H","H","H"],
            ["H","H","H","H","H","H","H","H","H","H"],
            ["H","H","H","H","H","H","H","H","H","H"],
            ["H","H","H","H","H","H","H","H","H","H"],
            ["H","H","H","H","H","H","H","H","H","H"],
            ["H","S","S","S","S","S","S","S","H","H"],
            ["S","S","S","S","S","S","S","S","S","S"],
            ["S","S","S","S","S","S","S","S","S","S"],
            ["S","S","S","S","S","S","S","S","S","S"]
            
        ]
    @IBOutlet weak var dealerCard1: UIImageView!
    @IBOutlet weak var dealerCard2: UIImageView!
    @IBOutlet weak var dealerCard3: UIImageView!
    @IBOutlet weak var dealerCard4: UIImageView!
    @IBOutlet weak var dealerCard5: UIImageView!
    @IBOutlet weak var dealerCard6: UIImageView!
    @IBOutlet weak var dealerCard7: UIImageView!
    var dealerCardViews:[UIImageView!]{
        return [dealerCard1,dealerCard2,dealerCard3,dealerCard4,dealerCard5,dealerCard6,dealerCard7]
    }
    
    @IBOutlet weak var AICard1: UIImageView!
    @IBOutlet weak var AICard2: UIImageView!
    @IBOutlet weak var AICard3: UIImageView!
    @IBOutlet weak var AICard4: UIImageView!
    @IBOutlet weak var AICard5: UIImageView!
    @IBOutlet weak var AICard6: UIImageView!
    @IBOutlet weak var AICard7: UIImageView!
//    var AICardViews:[UIImageView!]{
//        return [AICard1,AICard2,AICard3,AICard4,AICard5,AICard6,AICard7]
//    }
    
    @IBOutlet weak var playerCard1: UIImageView!
    @IBOutlet weak var playerCard2: UIImageView!
    @IBOutlet weak var playerCard3: UIImageView!
    @IBOutlet weak var playerCard4: UIImageView!
    @IBOutlet weak var playerCard5: UIImageView!
    @IBOutlet weak var playerCard6: UIImageView!
    @IBOutlet weak var playerCard7: UIImageView!
//    var playerCardViews:[UIImageView!]{
//        return [playerCard1,playerCard2,playerCard3,playerCard4,playerCard5,playerCard6,playerCard7]
//    }
    
    var allPlayerCardViews:[[UIImageView!]]{
        return [[AICard1,AICard2,AICard3,AICard4,AICard5,AICard6,AICard7],[playerCard1,playerCard2,playerCard3,playerCard4,playerCard5,playerCard6,playerCard7]]
    }
    
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var dealButton: UIButton!
    @IBOutlet weak var standButton: UIButton!
    
    @IBOutlet weak var scoreLabel1: UILabel!
    @IBOutlet weak var scoreLabel2: UILabel!
    
    var scoreLabels:[UILabel!]{
        return [scoreLabel1,scoreLabel2]
    }
    
    @IBOutlet weak var totalScore1: UILabel!
    @IBOutlet weak var totalScore2: UILabel!
    
    var totalScores:[UILabel!]{
        return [totalScore1,totalScore2]
    }
    
    @IBOutlet weak var hitOrStand: UILabel!
    
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player2: UILabel!
    
    var playersLabel: [UILabel!] {
        return [player1, player2]
    }

    @IBOutlet weak var player1Hand2: UILabel!

    @IBOutlet weak var player2Hand2: UILabel!
    
    var playersHands:[UILabel!]{
        return [player1Hand2,player2Hand2]
    }
    
    @IBOutlet weak var dollarSign: UILabel!
    
    @IBOutlet weak var betText: UITextField!
   
    @IBOutlet weak var betLabel: UIButton!

//    var playerIndex:Int = -1
    
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
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    var shareData : SingletonA = SingletonA.sharedInstance
    
    var deckNumber:Int = 3
    var playerNumber:Int = 2
    var score:Int = 100
    var betValue:Int = 0
    var inPlay = false
    var playerDone = false
    var count = 5
    var loadNewGame = true;
    
    var players:[Player] = []
    var dealer:Player = Player(name: "")
    var deckObj:Deck = Deck(numOfDeck: 3)
 
    func clearImage(){
        standButton.hidden = true
        hitOrStand.hidden = true
        hitButton.hidden = true
        var inPlay = true
        var playerDone = false
        for i in 0...6{
            if(dealerCardViews[i].image != nil){
                dealerCardViews[i].image = nil
            }
            
        }
        
        for index in 0...(playerNumber-1) {
            playersLabel[index].textColor = UIColor.grayColor()
            //
            for i in 0...6{
                if(allPlayerCardViews[index][i].image != nil){
                    allPlayerCardViews[index][i].image = nil
                }
            }
            
        }
    }
    func startNewRound(){
//        out = []
        clearImage()
        dollarSign.hidden = true
        betText.hidden = true
        dealButton.hidden = false
        betLabel.hidden = true
        
        for index in 0...(playerNumber-1) {
            playersHands[index].text = ""
            let player = Player(name: "Player \(index + 1)")
            player.money = 100
            players.append(player)
            scoreLabels[index].hidden = false
            totalScores[index].hidden = false
            totalScores[index].text = String(players[index].money)

            
        }
        loadNewGame = true
        count = 5
        deckObj = Deck(numOfDeck:deckNumber)
        deckObj.shuffleDeck()
        loadNewGame = false
    }
    @IBAction func deal(sender: UIButton) {
        startDeal()
    }
    func startDeal(){
        clearImage()
        var deckNumber = shareData.deckNumber
        dollarSign.hidden = false
        betText.hidden = false
        dealButton.hidden = true
        betLabel.hidden = false
        for index in 0...(playerNumber - 1) {
            playersHands[index].text = ""
            playersLabel[index].textColor = UIColor.grayColor()
            totalScores[index].text = String(players[index].money)
                if players[index].hands.count > 0 {
                    betText.text = String(players[index].hands[0].bet)
                    players[index].hands.removeAll(keepCapacity: true)
                }
            
        }
        
        if(count == 0 || loadNewGame || deckObj.deck.count < 30){
            deckObj = Deck(numOfDeck: deckNumber)
            deckObj.shuffleDeck()
            loadNewGame = false
            count = 5
            
        }
        
    }

    @IBAction func afterBet (sender: UIButton) {
        let dealerHand:Hand = Hand(bet: 0)
        dealer = Player(name: "Dealer")
        var rightBet = true
        for index in 0...(playerNumber-1) {
            let betMoney:Int? = betText.text.toInt()
            if index > 0 && (betMoney < 1 || betMoney > players[index].money) {
                rightBet = false
                let alert = UIAlertController(title: title, message: "\(players[index].name)'s bet must be above 1 and less than your score \(players[index].money)", preferredStyle: .Alert)
                let action = UIAlertAction(title: "Ok", style: .Default, handler: {action in self.startDeal()})
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
                betText.text = ""
            }
            
        }
        if rightBet {
            for index in 0...(playerNumber - 1) {
                var betMoney:Int? = betText.text.toInt()!
                //for AI bet if player bet > AI money AI all in 
                // else AI bet the same as player
                if index == 0 && betMoney > players[0].money {
                    betMoney = players[0].money
                    
                }
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
        dealButton.hidden = true
        hitButton.hidden = false
        standButton.hidden = false
        betLabel.hidden = true
        hitOrStand.hidden = true
        dollarSign.hidden = true
        betText.hidden = true
        
        for index in 0...(playerNumber-1) {
            playersLabel[index].textColor = UIColor.whiteColor()
            totalScores[index].text = String(players[index].money)
        }
    }
    
    
    func dealFirstTwoCard(){
        for index in 0...(playerNumber-1){
        
            var dealCard = deckObj.dealCard()
            players[index].hands[0].appendCard(dealCard)
            var plimage: UIImage? = UIImage(named: dealCard.simpleDescription())
            allPlayerCardViews[index][0].image = plimage
            println(dealCard.simpleDescription())
        }
        let de1 = deckObj.dealCard()
        dealer.hands[0].appendCard(de1)
        var imageD1: UIImage? = UIImage(named: de1.simpleDescription())
        dealerCardViews[0].image = imageD1
        println(de1.simpleDescription())
        for index in 0...(playerNumber-1){
                let dealCard2 = deckObj.dealCard()
                players[index].hands[0].appendCard(dealCard2)
                var image: UIImage? = UIImage(named: dealCard2.simpleDescription())
                allPlayerCardViews[index][1].image = image
                checkBlackJack(players[index],index:index)
                println(dealCard2.simpleDescription()+"\(index)")
        
        }
        
        let de2 = deckObj.dealCard()
        dealer.hands[0].appendCard(de2)
        var imageD2: UIImage? = UIImage(named: "back")
        dealerCardViews[1].image = imageD2
        println(de2.simpleDescription())
        inPlay = true
        playerDone = false
        continuePlay()
    }
    func checkBlackJack(player:Player,index:Int) {
        if player.hands[0].value == 21{
//            if index == 1{
//                hitButton.hidden = true
//                standButton.hidden = true
//            }
            playersLabel[index].textColor = UIColor.redColor()
            playersHands[index].text = "Congrats, you are Black Jack"
            println(" \(index)Congrats, you are Black Jack")
            
        }
    }
    
    func continuePlay(){
        
    
        if !playerDone && players[1].hands[0].value < 21 {
                hitOrStand.hidden = false
                hitOrStand.text = "Hit? or Stand?"
                hitButton.hidden = false
                standButton.hidden = false
            
        }else if inPlay && playerDone && players[0].hands[0].value < 21{
            println("AIplay")
            aiPlay();
        }
        else{
            
            var currHand = dealer.hands[0].handArray
//            dealerHand1.text = currHand[currHand.count - 1].simpleDescription() + "\n"
            
            while dealer.hands[0].value < 17 {
                var dlCard = deckObj.dealCard()
                dealer.hands[0].appendCard(dlCard)
            }
//            dealerHand1.text = ""
            var i = 0
            for card in dealer.hands[0].handArray {
//                dealerHand1.text?.extend(card.simpleDescription() + " ")
                let dealerImage:UIImage? = UIImage(named: card.simpleDescription() )
                dealerCardViews[i].image = dealerImage
                i++
            }
            inPlay = false
            countMoney()
            
           
        }
    }
    func aiPlay(){
//        usleep(300000)
        playersLabel[1].textColor = UIColor.grayColor()
//        var count = players[0].hands[0].handArray.count
        var dealercard = dealer.hands[0].handArray[0].rank.rawValue
        if(dealercard > 10){
            dealercard = 10
        }

            let playerHardValue = players[0].hands[0].hardValue
            let playerSoftValue = players[0].hands[0].value
            if playerHardValue != playerSoftValue {
                var action = softArray[playerSoftValue - 12][dealercard - 1]
                println(action)
                if action == "H" {
                    println("sleep")
                    hitfunc(0)
                    
                }else{
                    inPlay = false
                    continuePlay()
                }
            }else{
                var action = hardArray[playerHardValue - 4][dealercard - 1]
                println(action)
                if action == "H" {
                    println("sleep")        
                    hitfunc(0)
                }else{
                    inPlay = false
                    continuePlay()
                }
        }

    }
    
    
    @IBAction func hit(sender: UIButton) {
        if players[1].hands[0].handArray.count == 7 {
            playerDone = true
            hitButton.hidden = true
            standButton.hidden = true
            continuePlay()
        }
        hitOrStand.hidden = true
        hitfunc(1)
        
        
    }
    func hitfunc(index:Int){
            let cardCount = players[index].hands[0].handArray.count
            let plCard = deckObj.dealCard()
            players[index].hands[0].appendCard(plCard)
            let pImage:UIImage? = UIImage(named: plCard.simpleDescription())
            allPlayerCardViews[index][cardCount].image = pImage
            checkResult(players[index],index:index)   

    }
    func checkResult(player:Player,index:Int){
        if inPlay == true && player.hands[0].value < 21{
            continuePlay()
        }
        else if inPlay == true && player.hands[0].value == 21 {
            playersLabel[index].textColor = UIColor.redColor()
            hitButton.hidden = true
            standButton.hidden = true
            playersHands[index].text = "21 points"
            if index == 0 {
                inPlay = false
            }
            if index == 1{
                inPlay = true
                playerDone = true
            }
            continuePlay()
            
        }
        else if inPlay == true && player.hands[0].value > 21 {
            hitButton.hidden = true
            standButton.hidden = true
            playersHands[index].text = "Busted"
            if index == 0 {
                inPlay = false
            }
            if index == 1{
                inPlay = true
                playerDone = true
            }
            continuePlay()
        }
        
        
        
    }
    
    
    @IBAction func stand(sender: UIButton) {
        playerDone = true
        hitButton.hidden = true
        standButton.hidden = true
        continuePlay()
    }
    

    
    func countMoney(){
        let dealerValue = dealer.hands[0].value
        for index in 0...(playerNumber-1){
           
                let playerValue = players[index].hands[0].value
                let betValue = players[index].hands[0].bet
                if  dealerValue > 21 {
                    if playerValue > 21 {
                        playersHands[index].text = "It is a tie"
                        players[index].money += betValue
                    }else{
                        playersHands[index].text = "Congrats! Won \(betValue) score"
                        players[index].money += 2 * betValue
                    }
                    
                }else if dealerValue == 21 {
                    if playerValue == 21 {
                        playersHands[index].text = "It is a tie"
                        players[index].money += betValue
                    }else{
                        playersHands[index].text = "Sorry, Lose \(betValue) score"
                    }
                }else{
                    if playerValue > 21 {
                         playersHands[index].text = "Sorry,Lose \(betValue) score"
                    }else if playerValue > dealerValue {
                        playersHands[index].text = "Congrats! Won \(betValue) score"
                        players[index].money += 2 * betValue
                    }else if playerValue == dealerValue {
                        playersHands[index].text = "It is a tie"
                        players[index].money += betValue
                    }else {
                        playersHands[index].text = "Sorry, Lose \(betValue) score"
                    }
                }
            
        }
        dealEnd()
        

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
        func gameOver(){
//        for index in 0...(playerNumber-1) {
//            if players[index].money == 0{
//                restPlayer--
//            }
//            
//        }
        if players[0].money == 0 || players[1].money == 0{
            var pName = ""
            if players[0].money == 0 && players[1].money == 0{
                pName = "AI and You"
            }else if players[0].money == 0{
                pName = "AI"
            }else{
                pName = "You"
            }
            let alert = UIAlertController(title: title, message: "Sorry! \(pName) are out! Game Over", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Click NewGame to Restart", style: .Default, handler: {action in self.gameOverLabelUpdate()})
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
            
        }
    }
    func gameOverLabelUpdate(){
        hitButton.hidden = true
        dealButton.hidden = true
        
        clearImage()
        for index in 0...(playerNumber-1) {
            playersLabel[index].textColor = UIColor.grayColor()
//            
            totalScores[index].hidden = true
            scoreLabels[index].hidden = true
            
        }
        
    }

    
}