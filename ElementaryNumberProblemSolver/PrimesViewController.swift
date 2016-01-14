//
//  PrimeFactorizationViewController.swift
//  ElementaryNumberTools
//
//  Created by Stephen  on 2015-12-29.
//  Copyright © 2015 StephenXie. All rights reserved.
//

import UIKit

class PrimesViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: properties
    
    @IBOutlet weak var xOutlet: UITextField!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var Answer: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        self.xOutlet.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // dismiss keyboard when tapping outside
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }

    // dismiss keyboard when return is tapped
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
@IBAction func primalityTest(sender: AnyObject) {
        view.endEditing(true)
        if xOutlet.text!.isEmpty {
            messageField.text = "Please enter a positive integer greater than 1"
            Answer.text = ""
            return
        }
        let x = Int(xOutlet.text!)
        if x == nil {
            messageField.text = "Please enter a positive integer greater than 1"
            Answer.text = ""
            return
        }
        if x <= 1 {
            messageField.text = "Please enter a positive integer greater than 1"
            Answer.text = ""
            return
        }
        var result:String
        if isPrime(x!) == true {
            result = "\(String(x!)) is a prime"
        } else {
            result = "\(String(x!)) is not a prime"
        }
        Answer.text = result
        messageField.text = ""
    }

    @IBAction func primefactorization(sender: UIButton) {
        view.endEditing(true)
        if xOutlet.text!.isEmpty {
            messageField.text = "Please enter a positive integer greater than 1"
            Answer.text = ""
            return
        }
        let x = Int(xOutlet.text!)
        if x == nil {
            messageField.text = "Please enter a positive integer greater than 1"
            Answer.text = ""
            return
        }
        if x <= 1 {
            messageField.text = "Please enter a positive integer greater than 1"
            Answer.text = ""
            return
        }
        let result = primeFactorization(x!)
        Answer.text = result
        messageField.text = ""
    }
}
