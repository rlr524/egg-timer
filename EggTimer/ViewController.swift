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
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 11
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        if (hardness == "Soft") {
            print(softTime)
        } else if (hardness == "Medium") {
            print(mediumTime)
        } else {
            print(hardTime)
        }
    }
}