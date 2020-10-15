//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

     var player: AVAudioPlayer!

       override func viewDidLoad() {
           super.viewDidLoad()
       }

       
    func playSound(_ title:String) {
           let url = Bundle.main.url(forResource: title, withExtension: "wav")
           player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
                   
       }



    
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(sender.currentTitle!)
//        print(sender.currentTitle!)
        //Reduces the sender's (the button that got pressed) opacity to half.
        UIView.animate(withDuration: 0.3) {
            sender.alpha = 0.5
        }

        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            UIView.animate(withDuration: 0.3) {
                sender.alpha = 1.0
            }
        }
    }
    

}

