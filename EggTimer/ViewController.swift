//
//  ViewController.swift
//  Egg Timer
//
//  Created by Rob Ranf on 05/29/2020.
//  Copyright ©2020 Emiya Consulting LLC
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // soft egg ~ 5 min
    // medium egg ~ 7 min
    // hard egg ~ 11 min
    // with water brought to a boil then lowered to a rapid simmer
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    
    let eggTimes: [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 660]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness: String?
        hardness = sender.currentTitle
        // because hardness is an optional, we force unwap it (!) in case the value is nil
        // we then force unwrap our whole print value because it is implicitly coerced
        // from an "Int" (the value of our keys in our dict above which is what we
        // actually want to print) to a type of "Any"
        totalTime = eggTimes[hardness!]!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        }
    func playSound(soundName: String) {
        guard let sound = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            else {return}
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint: AVFileType.mp3.rawValue)
            guard let audioPlayer = audioPlayer else {return}
            audioPlayer.play()
        }
        catch {
            print(error)
        }
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = (Float(secondsPassed) / Float(totalTime))
            print(progressBar.progress)
        } else {
            timer.invalidate()
            playSound(soundName: "sound")
            titleLabel.text = "DONE!"
            
        }
    }
    
    @IBAction func resetSelected(_ sender: UIButton) {
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = "How do you like your eggs?"
    }
    
}
