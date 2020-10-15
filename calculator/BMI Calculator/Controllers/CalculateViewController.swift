//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSilder: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(weightSlider.value)
        // Do any additional setup after loading the view.
        heightLabel.text = String(format: "%.2f", heightSilder.value) + "m"
        weightLabel.text = String(format: "%.0f", weightSlider.value) + "kg"
        
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
//        print(String(format: "%.2f", sender.value))
        heightLabel.text = String(format: "%.2f", sender.value) + "m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%.0f", sender.value) + "kg"
//        print(Int(sender.value))
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSilder.value
        let weight = weightSlider.value
        
//        let bmi = weight / pow(height, 2)
        calculatorBrain.calculateBMI(height: height,weight: weight)
//        bmiValue = String(format: "%.1f", bmi)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            
        }
    }
}

