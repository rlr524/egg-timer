//
//  ViewController.swift
//  Egg Timer
//
//  Created by Rob Ranf on 05/29/2020.
//  Copyright ©2020 Emiya Consulting LLC
//

import UIKit

class ViewController: UIViewController {
    // soft egg ~ 5 min
    // medium egg ~ 7 min
    // hard egg ~ 11 min
    // with water brought to a boil then lowered to a rapid simmer
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes: [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 660]
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness: String?
        hardness = sender.currentTitle
        // because hardness is an optional, we force unwap it (!) in case the value is nil
        // we then force unwrap our whole print value because it is implicitly coerced
        // from an "Int" (the value of our keys in our dict above which is what we
        // actually want to print) to a type of "Any"
        
        var timeLeft = eggTimes[hardness!]
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            timer in
            
            timeLeft! -= 1
            print(timeLeft!)
            
            if(timeLeft == 0) {
            timer.invalidate()
            self.titleLabel.text = "DONE!"
            }
        }
        }
}
