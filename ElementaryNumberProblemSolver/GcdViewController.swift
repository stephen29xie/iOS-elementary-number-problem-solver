//
//  ViewController.swift
//  ElementaryNumberTools
//
//  Created by Stephen  on 2015-12-11.
//  Copyright © 2015 StephenXie. All rights reserved.
//

import UIKit

class GcdViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties

    @IBOutlet weak var Integer1: UITextField!
    @IBOutlet weak var Integer2: UITextField!
    @IBOutlet weak var Answer: UITextView!
    @IBOutlet weak var messageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.Integer1.delegate = self
        self.Integer2.delegate = self
        
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


    @IBAction func solveGcd(sender: UIButton) {
        view.endEditing(true)
        
        if Integer1.text!.isEmpty || Integer2.text!.isEmpty {
            messageField.text = "Please enter valid integers"
            Answer.text = ""
            return
        }
        let Int1 = Int(Integer1.text!)
        let Int2 = Int(Integer2.text!)
        if Int1 == nil || Int2 == nil {
            messageField.text = "Please enter valid integers"
            Answer.text = ""
            return
        }
        let result = calculateGcd(Int1!, int2:Int2!)
        Answer.text = "gcd(\(String(Int1!)),\(String(Int2!))) = \(String(result))"
        messageField.text = ""
    }
    
    
    
}