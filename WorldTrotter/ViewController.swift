//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Tadmin on 6/14/17.
//  Copyright © 2017 Tadmin. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var celsiusLabel: UILabel!
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
        
    }

 
    
    
}

