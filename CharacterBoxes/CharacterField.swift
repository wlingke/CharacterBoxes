//
//  CharacterField.swift
//  CharacterBoxes
//
//  Created by Lingke Wang on 10/20/14.
//  Copyright (c) 2014 Lingke Wang. All rights reserved.
//

import UIKit

class CharacterField: UITextField, UITextFieldDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.borderStyle = UITextBorderStyle.RoundedRect
        self.delegate = self

    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool {

        let newLength = countElements(textField.text!) + countElements(string!) - range.length
        return newLength <= 1 //Bool
        
    }
    
}
