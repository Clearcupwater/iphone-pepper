//
//  ViewController.swift
//  Buggy
//
//  Created by Virtual on 6/20/17.
//  Copyright © 2017 Virtual. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped (_ sender: UIButton){
        print("Button is tapped")
        
        badMethod()
        
        print("\(#function), \(#file),\(#line)" )
    }
    
    func badMethod() {
        let array = NSMutableArray()
        
        for i in 0..<10 {
            array.insert(i, at: i)
            
        }
        
        for _ in 0...10 {
            array.remove(at:0)
        }
    }

}

