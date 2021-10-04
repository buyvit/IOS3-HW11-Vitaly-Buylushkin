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
    private var count = 300
    private var myTimer = Timer()

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myProgressView: UIProgressView!
    
    @IBOutlet weak var myButton: UIButton!
    
    
    @IBAction func myButtonPressed(_ sender: Any) {
        isStarted = !isStarted
        if isStarted {
            self.myButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            createTimer()
        } else {
            self.myButton.setImage(UIImage(systemName: "play"), for: .normal)
            self.myTimer.invalidate()
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
    
    //MARK: - Timer
    private func createTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 1,
                                       target: self,
                                       selector: #selector(updateProgressView),
                                       userInfo: nil,
                                       repeats: true)
    }
    
    //MARK: - Selector
    @objc private func updateProgressView() {
        if myProgressView.progress != 1.0 {
            count -= 1
            if isWorkTime {
                self.myProgressView.progress += 0.0006667
                let time = secondsToMinutesSeconds(count)
                self.myLabel.text = makeTimeString(time.0, time.1)
            } else {
                self.myProgressView.progress += 0.00333333
                let time = secondsToMinutesSeconds(count)
                self.myLabel.text = makeTimeString(time.0, time.1)
            }
        } else  {
            isWorkTime = !isWorkTime
            self.myProgressView.progress = 0.0
            if isWorkTime {
                self.myButton.setTitleColor(UIColor.red, for: .normal)
                self.myButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
                self.myLabel.textColor = UIColor.red
                self.myLabel.text = "25 : 00"
                count = 1500
                self.myProgressView.progressTintColor = UIColor.red
            } else {
                self.myButton.setTitleColor(UIColor.green, for: .normal)
                self.myButton.setImage(UIImage(systemName: "play"), for: .normal)
                self.myLabel.textColor = UIColor.green
                self.myLabel.text = "05 : 00"
                count = 300
                self.myProgressView.progressTintColor = UIColor.green
            }
        }
}
    
    //MARK: - Counter
    private func secondsToMinutesSeconds(_ seconds: Int) -> (Int, Int) {
        return ((seconds/60), (seconds%60))
    }

    private func makeTimeString(_ minutes: Int, _ seconds: Int) -> String {
        var timeStr = ""
        timeStr += String(format: "%02d", minutes)
        timeStr += " : "
        timeStr += String(format: "%02d", seconds)
        return timeStr
        
    }


}

