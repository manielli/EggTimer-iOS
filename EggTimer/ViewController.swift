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
    
//    let softTime = 5;
//    let mediumTime = 7;
//    let hardTime = 12;
    
    var player: AVAudioPlayer!

    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
        
    var timer = Timer()
    
    var secondsPassed = 0
    
    var totalTime = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        titleLabel.text = hardness
        secondsPassed = 0
        progressBar.progress = 0.0
        timer.invalidate()

//        if hardness == "Soft" {
//            print(softTime)
//        } else if hardness == "Medium" {
//            print(mediumTime)
//        } else if hardness == "Hard" {
//            print(hardTime)
//        } else {
//            print("Error")
//        }
        
//        switch hardness {
//            case "Soft":
//                print(softTime)
//            case "Medium":
//                print(mediumTime)
//            case "Hard":
//                print(hardTime)
//            default:
//                print("Error")
//        }
        
        totalTime = eggTimes[hardness]!

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

    }

    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
            if progressBar.progress == 1.0 {
                titleLabel.text = "DONE!"
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
            }
        } else {
            timer.invalidate()
        }
    }

}
