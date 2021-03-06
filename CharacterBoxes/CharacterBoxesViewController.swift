//
//  CharacterBoxesViewController.swift
//  CharacterBoxes
//
//  Created by Lingke Wang on 10/16/14.
//  Copyright (c) 2014 Lingke Wang. All rights reserved.
//

import UIKit

class CharacterBoxesViewController: UIViewController {
    
    private var frame: CGRect
    private var rows: Int
    private var columns: Int
    private var horizontalPadding: Double //container padding to center the boxes in the view
    
    private let horizontalSpacing = 10
    private let verticalSpacing = 10
    private let fieldWidth = 20
    private let fieldHeight = 20
    
    private var fieldMatrix: [[UITextField]]
    
    init(frame:CGRect, rows:Int, columns: Int){
        self.frame = frame
        var max_columns = Int(roundf((Float(frame.width) + Float(horizontalSpacing))/Float(fieldWidth + horizontalSpacing)))
        self.columns = min(max_columns, columns)
        
        var max_rows = Int(roundf(Float(frame.height) + Float(verticalSpacing)/Float(fieldHeight + verticalSpacing)))
        self.rows = min(max_rows, rows)
        self.fieldMatrix = []
        for (var i = 0; i < self.rows; i++){
            self.fieldMatrix.append([])
        }
        
        self.horizontalPadding = (Double(frame.width) - Double(columns - 1) * Double(horizontalSpacing) - Double(columns) * Double(fieldWidth))/2
    
        
        super.init(nibName:nil, bundle: nil)
    }

    required convenience init(coder aDecoder: NSCoder) {
        self.init(frame: CGRectMake(0, 0, 0, 0), rows: 0, columns: 0)
    }

    override func loadView() {
        var view = UIView(frame: self.frame)
        view.bounds = frame
        view.backgroundColor = UIColor.redColor();

        for (var i = 0; i < self.rows; i++){
            for(var j = 0; j<self.columns; j++){
                var array = self.fieldMatrix[i]
                var x = Double(horizontalPadding + Double(j*(fieldWidth + horizontalSpacing)))
                var field = CharacterField(frame: CGRect(x: x, y: Double(i * (fieldHeight + verticalSpacing)), width: Double(fieldWidth), height: Double(fieldHeight)))
                array.append(field)
                view.addSubview(field)
            }
        }
        self.view = view;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func boxValue(sender: UITextField!){
        println(sender.text)
    }
    
}