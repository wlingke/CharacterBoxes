//
//  ViewController.swift
//  CharacterBoxes
//
//  Created by Lingke Wang on 10/16/14.
//  Copyright (c) 2014 Lingke Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CharacterBoxesDelegate {
    func valuesDidChange(values: Array<String>) {
        println(values)
    }

    var boxes = CharacterBoxes(frame: CGRect(x: 30, y: 250, width: UIScreen.mainScreen().bounds.size.width - 30*2, height: 100), rows:2 , columns: 7, delegate: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boxes.delegate = self
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
    
    @IBAction func letterChange(){
        boxes.setCharacterAt(row: 1, column: 1, withString: "a")
    }
    
}

