//
//  CongruenceViewController.swift
//  ElementaryNumberTools
//
//  Created by Stephen  on 2015-12-26.
//  Copyright © 2015 StephenXie. All rights reserved.
//

import UIKit

class CongruenceViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: properties
    @IBOutlet weak var bOutlet: UITextField!
    @IBOutlet weak var mOutlet: UITextField!
    @IBOutlet weak var Answer: UITextView!
    @IBOutlet weak var messageField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mOutlet.delegate = self
        self.bOutlet.delegate = self
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
    
    //MARK: actions
    
    @IBAction func solveCongruence(sender: AnyObject) {
        view.endEditing(true)
        if bOutlet.text!.isEmpty || mOutlet.text!.isEmpty {
            messageField.text = "Please enter valid integers"
            Answer.text = ""
            return
        }
        let b = Int(bOutlet.text!)
        let m = Int(mOutlet.text!)
        if b == nil || m == nil {
            messageField.text = "Please enter valid integers"
            Answer.text = ""
            return
        }
        if m < 1 {
            messageField.text = "Please enter a valid positive integer for m"
            Answer.text = ""
            return
        }
        let result = modulo(b!, m:m!)
        Answer.text = String(b!) + " (mod " + String(m!) + ")  ≡ " + String(result)
        messageField.text = ""
        
    }
}

