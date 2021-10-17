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
    private var progressStep = Double()
   
    private var myTimer = Timer()

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myProgressView: UIProgressView!
    
    @IBOutlet weak var myButton: UIButton!
    
    
    @IBAction func myButtonPressed(_ sender: Any) {
        isStarted = !isStarted
        
        if isStarted {
            self.myButton.setImage(UIImage(systemName: "pause"), for: .normal)
            createTimer()
        } else {
            self.myButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            self.myTimer.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myProgressView.progress = 0.0
        progressStep = 1.0 / Double(count)
        
        self.myButton.setImage(UIImage(systemName: "play"), for: .normal)
        isWorkTime = true
        self.myButton.setTitleColor(UIColor.red, for: .normal)
        self.myLabel.textColor = UIColor.red
        let time = secondsToMinutesSeconds(count)
        self.myLabel.text = makeTimeString(time.0, time.1)
        self.myProgressView.progressTintColor = UIColor.red
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
            self.myProgressView.progress += Float(progressStep)
            let time = secondsToMinutesSeconds(count)
            self.myLabel.text = makeTimeString(time.0, time.1)
        } else  {
            isWorkTime = !isWorkTime
            self.myProgressView.progress = 0.0
            
            isStarted = !isStarted
            if isStarted {
                self.myButton.setImage(UIImage(systemName: "pause"), for: .normal)
                createTimer()
            } else {
                self.myButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
                self.myTimer.invalidate()
            }
            
            if isWorkTime {
                self.myButton.setTitleColor(UIColor.red, for: .normal)
                self.myLabel.textColor = UIColor.red
                count = 1500
                let time = secondsToMinutesSeconds(count)
                self.myLabel.text = makeTimeString(time.0, time.1)
                self.myProgressView.progressTintColor = UIColor.red
            } else {
                self.myButton.setTitleColor(UIColor.green, for: .normal)
                self.myLabel.textColor = UIColor.green
                count = 300
                let time = secondsToMinutesSeconds(count)
                self.myLabel.text = makeTimeString(time.0, time.1)
                self.myProgressView.progressTintColor = UIColor.green
            }
            progressStep = 1.0 / Double(count)
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

