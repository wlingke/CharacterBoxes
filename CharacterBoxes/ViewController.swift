//
//  ViewController.swift
//  CharacterBoxes
//
//  Created by Lingke Wang on 10/16/14.
//  Copyright (c) 2014 Lingke Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var boxes = CharacterBoxes(frame: CGRect(x: 30, y: 250, width: UIScreen.mainScreen().bounds.size.width - 30*2, height: 100), rows:2 , columns: 7)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func test(){
       self.view.addSubview(boxes)
    }
    
    @IBAction func dismiss(){
        boxes.removeFromSuperview()
    }
    
}

