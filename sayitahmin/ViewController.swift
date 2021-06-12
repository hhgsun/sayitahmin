//
//  ViewController.swift
//  sayitahmin
//
//  Created by Mac9 on 12.06.2021.
//  Copyright © 2021 hhgsun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var totalRound: Int = 10
    var currentValue: Int = 0
    
    var targetValue: Int = 0
    var round: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var lblRound: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblTarget: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()
    }
    
    @IBAction
    func btnNewGame() {
        newGame()
    }

    @IBAction
    func btnResultGame(){
        if( round > totalRound - 1) {
            showMessage(title: "Oyun Bitti", message: "Artık Yeter Oynadığın \n Score:\(score)")
            newGame()
        } else {
            if( currentValue == targetValue ) {
                showMessage(title: "Aferim", message: "Tahminin iyi \(currentValue)")
            } else {
                showMessage(title: "Kötü Haber", message: "Tahminin Tutmadı \nHedef: \(targetValue) \nSeçimin: \(currentValue)")
            }
            calcScore()
            newRound()
        }
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    func showMessage(title:String, message: String){
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok Cnm", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func newRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        lblTarget.text = "\(targetValue)"
        currentValue = 0
        round += 1
        lblRound.text = "\(round) / 10"
    }
    
    func newGame(){
        lblRound.text = "0"
        lblScore.text = "0"
        round = 0
        score = 0
        newRound()
    }
    
    func calcScore() {
        let diff = abs(targetValue - currentValue)
        score += 100 - diff
        lblScore.text = "\(score)"
    }
    
}

