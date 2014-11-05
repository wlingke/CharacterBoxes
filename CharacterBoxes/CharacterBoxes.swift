//
//  CharacterBoxes.swift
//  CharacterBoxes
//
//  Created by Lingke Wang on 10/21/14.
//  Copyright (c) 2014 Lingke Wang. All rights reserved.
//

import UIKit

protocol CharacterBoxesDelegate {
    func valuesDidChange(values: Array<String>)
}

class CharacterBoxes: UIView {
    
    private var rows: Int
    private var columns: Int
    private var horizontalPadding: Double //container padding to center the boxes in the view
    
    private let horizontalSpacing = 10
    private let verticalSpacing = 10
    private let fieldWidth = 30
    private let fieldHeight = 30
    
    private var fieldMatrix: [[UITextField]]

    var delegate: CharacterBoxesDelegate?
    
    init(frame: CGRect, rows: Int, columns: Int, delegate: CharacterBoxesDelegate?) {
        var max_columns = Int(roundf((Float(frame.width) + Float(horizontalSpacing))/Float(fieldWidth + horizontalSpacing)))
        self.columns = min(max_columns, columns)
        
        var max_rows = Int(roundf(Float(frame.height) + Float(verticalSpacing)/Float(fieldHeight + verticalSpacing)))
        self.rows = min(max_rows, rows)
        self.fieldMatrix = []
        for (var i = 0; i < self.rows; i++){
            self.fieldMatrix.append([])
        }
        
        self.horizontalPadding = (Double(frame.width) - Double(columns - 1) * Double(horizontalSpacing) - Double(columns) * Double(fieldWidth))/2
        self.delegate = delegate
        
        super.init(frame: frame)
    }

    required convenience init(coder aDecoder: NSCoder) {
        self.init(frame: CGRectMake(0, 0, 0, 0), rows: 0, columns: 0, delegate: nil)
    }

    override func layoutSubviews() {
        self.backgroundColor = UIColor.whiteColor();
        
        for (var i = 0; i < self.rows; i++){
            for(var j = 0; j<self.columns; j++){
                
                var x = Double(horizontalPadding + Double(j*(fieldWidth + horizontalSpacing)))
                var field = CharacterField(frame: CGRect(x: x, y: Double(i * (fieldHeight + verticalSpacing)), width: Double(fieldWidth), height: Double(fieldHeight)))
                field.addTarget(self, action: Selector("characterBoxesDidChange"), forControlEvents: UIControlEvents.EditingChanged)
                self.fieldMatrix[i].append(field)
                self.addSubview(field)
            }
            
        }
        
    }
    
    func getCharacterAt(#row: Int, column: Int) -> String {
        return self.fieldMatrix[row][column].text
    }
    
    func setCharacterAt(#row: Int, column: Int, withString string: String) {
        if(row < 0 || row > self.rows){
            println("Row out of bounds")
            return
        }
        
        if(column < 0 || column > self.columns){
            println("Column out of bounds")
            return
        }
        
        if(countElements(string) != 1){
            println("String must be of length 1")
            return
        }
        
        self.fieldMatrix[row][column].text = string
        self.characterBoxesDidChange()
        
    }
    
    func getValues() -> Array<String>{
        var values = [String]();
        
        for(var i = 0; i<self.rows; i++){
            for(var j = 0; j<self.columns; j++){
                values.append(self.getCharacterAt(row:i, column: j))
            }
        }
        
        return values
        
    }
    
    func characterBoxesDidChange() {
        self.delegate?.valuesDidChange(self.getValues())
    }
}
