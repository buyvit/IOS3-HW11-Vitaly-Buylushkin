//
//  ViewController.swift
//  IOS3-HW11-Vitaly Buylushkin
//
//  Created by Vitaly Buylushkin on 03.10.2021.
//

import UIKit

class ViewController: UIViewController {
    private var isWorkTime = true
    private var isStarted = false
    private var count = 1500

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myProgressView: UIProgressView!
    
    @IBOutlet weak var myButton: UIButton!
    
    
    @IBAction func myButtonPressed(_ sender: Any) {
        isStarted = !isStarted
        if isStarted {
            self.myButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            self.myButton.setImage(UIImage(systemName: "play"), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myProgressView.progress = 0.0
        self.myButton.setImage(UIImage(systemName: "play"), for: .normal)
        if count == 1500 {
            isWorkTime = true
            self.myButton.setTitleColor(UIColor.red, for: .normal)
            self.myLabel.textColor = UIColor.red
            self.myProgressView.progressTintColor = UIColor.red
        } else {
            isWorkTime = false
            self.myButton.setTitleColor(UIColor.green, for: .normal)
            self.myLabel.textColor = UIColor.green
            self.myProgressView.progressTintColor = UIColor.green
        }
    }


}

