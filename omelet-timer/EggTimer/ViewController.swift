//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!

    let eggTime = ["Soft":3, "Medium":4, "Hard":7]
    var timer = Timer()
    var secondPassed = 0
    var totalTime = 0
    var player: AVAudioPlayer!
    var temp = ""
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        temp = titleLabel.text!
        titleLabel.text = "Cooking..."
        progressBar.progress = 0.0
        secondPassed = 0
        timer.invalidate()
        let hardness = sender.currentTitle!
            totalTime = eggTime[hardness]!
//        print(eggTime[hardness]!)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updatetimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updatetimer() {
        if secondPassed < totalTime {
//             let percentage = secondPassed / totalTime
            secondPassed+=1
            progressBar.progress = Float (secondPassed)/Float(totalTime)
            
            
        }
        else
        {
            timer.invalidate()
            playSound("alarm_sound")
            
            titleLabel.text = "DONE!"
        }
        
    }
    
    
    func playSound(_ title:String) {
        let url = Bundle.main.url(forResource: title, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }

}
