//
//  LdeViewController.swift
//  ElementaryNumberTools
//
//  Created by Stephen  on 2015-12-26.
//  Copyright © 2015 StephenXie. All rights reserved.
//

import UIKit

class LdeViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var aOutlet: UITextField!
    @IBOutlet weak var bOutlet: UITextField!
    @IBOutlet weak var cOutlet: UITextField!
    @IBOutlet weak var Answer: UITextView!
    @IBOutlet weak var messageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.bOutlet.delegate = self
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

    //MARK : actions
    
    @IBAction func solveLDE(sender: AnyObject) {
        view.endEditing(true)
        if aOutlet.text!.isEmpty || bOutlet.text!.isEmpty || cOutlet.text!.isEmpty {
            messageField.text = "Please enter valid integers"
            Answer.text = ""
            return
        }
        let a = Int(aOutlet.text!)
        let b = Int(bOutlet.text!)
        let c = Int(cOutlet.text!)
        if a == nil || b == nil || c == nil {
            messageField.text = "Please enter valid integers"
            Answer.text = ""
            return
        }
        let result = solveLde(a!, b:b!, c:c!)
        Answer.text = result
        messageField.text = ""
        
        
        
    }

}

