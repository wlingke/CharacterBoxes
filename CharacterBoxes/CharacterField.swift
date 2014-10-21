//
//  CharacterField.swift
//  CharacterBoxes
//
//  Created by Lingke Wang on 10/20/14.
//  Copyright (c) 2014 Lingke Wang. All rights reserved.
//

import UIKit

class CharacterField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.borderStyle = UITextBorderStyle.RoundedRect
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
