//
//  ViewController.swift
//  Assignment1_backjack
//
//  Created by xi su on 2/15/15.
//  Copyright (c) 2015 xi su. All rights reserved.
//

import UIKit
//import Foundati
class ViewController: UIViewController,UITextFieldDelegate {
    
  
    @IBOutlet weak var decksOfCard: UITextField!
   
    var shareData :SingletonA = SingletonA.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.

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
    @IBAction func start(sender: AnyObject) {
        
            shareData.deckNumber = decksOfCard.text.toInt()!
    }

    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        let deckNumber = decksOfCard.text.toInt()!
        
        if deckNumber > 10 || deckNumber <= 0  {
            let alert = UIAlertController(title: "Setting Incorrect", message: "Please enter number as required", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
            return false
        }else{
            return true
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "PlayerViewController"{
            let controller = segue.destinationViewController as PlayerViewController
            controller.deckNumber = decksOfCard.text.toInt()!

         }
    }
}