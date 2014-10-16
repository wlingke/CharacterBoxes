//
//  ViewController.swift
//  CharacterBoxes
//
//  Created by Lingke Wang on 10/16/14.
//  Copyright (c) 2014 Lingke Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var fields = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var frame = CGRectMake(50, 70, 200, 30)
        var f1 = UITextField(frame: frame)
        f1.addTarget(self, action: "boxValue:", forControlEvents: UIControlEvents.EditingChanged)
        self.view.addSubview(f1)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func boxValue(sender: UITextField!){
        println(sender.text)
    }
    
}

