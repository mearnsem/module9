//
//  ViewController.swift
//  SimplePersistence
//
//  Created by Emily Mearns on 5/11/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //check nsuserdefaults for saved text
        let savedText = NSUserDefaults.standardUserDefaults().objectForKey("savedText")
        //if saved text, set text to textfield's value
        if let text = savedText as? String {
            textField.text = text
        }
    }

    @IBAction func saveTextButtonTapped(sender: AnyObject) {
        //capture text from textfield value
        let capturedText = textField.text
        //save text to nsuserdefaults
        NSUserDefaults.standardUserDefaults().setObject(capturedText, forKey: "savedText")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

