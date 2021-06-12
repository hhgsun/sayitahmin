//
//  ViewController.swift
//  sayitahmin
//
//  Created by Mac9 on 12.06.2021.
//  Copyright © 2021 hhgsun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0;
    
    @IBOutlet weak var lblTarget: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    @IBAction
    func buttonClicked(){
        if( currentValue == targetValue ) {
            showMessage(title: "Aferim", message: "Tahminin iyi \(currentValue)")
        } else {
            showMessage(title: "Kötü Haber", message: "Tahminin Tutmadı \nHedef: \(targetValue) \nSeçimin: \(currentValue)")
        }
        newRound()
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
    }
}

