//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Alex Ho on 9/22/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//
import UIKit
import Foundation

class SecondViewController: UIViewController {
    var bmiValue = "0.0"
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        view.backgroundColor = .red
        label.text = bmiValue
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.addSubview(label)
    }
}
