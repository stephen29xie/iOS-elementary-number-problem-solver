//
//  LinearCongruenceViewController.swift
//  ElementaryNumberTools
//
//  Created by Stephen  on 2015-12-27.
//  Copyright © 2015 StephenXie. All rights reserved.
//

import UIKit

class LinearCongruenceViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: properties
    @IBOutlet weak var aOutlet: UITextField!
    @IBOutlet weak var cOutlet: UITextField!
    @IBOutlet weak var mOutlet: UITextField!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var Answer: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mOutlet.delegate = self
        self.aOutlet.delegate = self
        self.cOutlet.delegate = self
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

    
    
    @IBAction func solveLinCongruence(sender: AnyObject) {
        view.endEditing(true)
        
        if aOutlet.text!.isEmpty || mOutlet.text!.isEmpty || cOutlet.text!.isEmpty {
            messageField.text = "Please enter valid integers"
            Answer.text = ""
            return
        }
        let a = Int(aOutlet.text!)
        let c = Int(cOutlet.text!)
        let m = Int(mOutlet.text!)
        if a == nil || c == nil || m == nil {
            messageField.text = "Please enter valid integers"
            Answer.text = ""
            return
        }
        if m < 1 {
            messageField.text = "Please enter a valid positive integer for m"
            Answer.text = ""
            return
        }
        let result = linearCongruence(a!, c:c!, m:m!)
        Answer.text = result
        messageField.text = ""
        
        
    }
    
}
