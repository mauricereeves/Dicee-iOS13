//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//  Further modified by Maurice Reeves on 16-Apr-2020 learning iOS programming

import UIKit

class ViewController: UIViewController {
    // make the dice array a constant
    // I mean, probably okay for it to be
    // a variable because then we could
    // change the color of the dice, etc
    // but for now it's a constant
    
    // honestly I would prefer this to be a
    // map so then I could ref by a number,
    // or even an enum value
    let dice: [UIImage] = [
        #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")
    ]

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        spinImageView(imageView: diceImageView1, rotateLeft: false)
        spinImageView(imageView: diceImageView2, rotateLeft: true)
    }
    
    // gives us a method to spin our image view when we "roll" the dice
    func spinImageView(imageView: UIImageView, rotateLeft: Bool = true) {
        var radians: CGFloat = .pi / 3
        
        if (rotateLeft == false) {
            radians = radians * -1
        }
        
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [.curveLinear ], animations: {
            for _ in 1...13 {
                // spin the dice
                imageView.transform = imageView.transform.rotated(by: radians)
            }
        }, completion: setDiceValues)
    }
    
    // set the dice values
    func setDiceValues(_: Bool) {
        diceImageView1.image = dice[Int.random(in: 0...5)]
        diceImageView2.image = dice[Int.random(in: 0...5)]
    }
}

