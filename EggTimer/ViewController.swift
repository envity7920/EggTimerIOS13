//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
var player: AVAudioPlayer?


class ViewController: UIViewController {
    var totalTime  = 0;
    var secondsPassed = 0;
    
    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 7];
    
    @IBOutlet weak var titleLabel: UILabel!
  
    var timer = Timer()
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!;
      
        totalTime = eggTime[hardness]!;
   
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
    
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime);
           
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound("alarm_sound")
           
        }
    }
    
    func playSound(_ alarm: String) {
        let url = Bundle.main.url(forResource: alarm, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
     
    }
    

