//
//  SecondViewController.swift
//  xibtableviewpractice
//
//  Created by Hurraira Bhatti on 10/5/21.
//

import UIKit

class SecondViewController: UIViewController {
    var colorCode: String?
    
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let concreteData = colorCode {
            colorView.backgroundColor = UIColor(concreteData)
               }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
