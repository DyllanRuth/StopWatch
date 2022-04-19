//
//  ViewController.swift
//  StopWatch_druth
//
//  Created by STUDENT-SP22 on 4/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    
    var isRunning = false
    var startTime = TimeInterval()
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad() // Do any additional setup after loading the view.
        timeLabel.text = "00:00:00"
        isRunning = false
        buttonLabel.setTitle("START", for: .normal)
    }

    @IBAction func buttonAction(_ sender: Any) {
        if isRunning { // Watch is running, stop the time
            isRunning = false
            buttonLabel.setTitle("START", for: .normal)
            myTimer.invalidate() // Stop the clock
        } else { // Start the watch
            isRunning = true
            buttonLabel.setTitle("STOP", for: .normal)
            timeLabel.text = "00:00:00"
            myTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.tickAction), userInfo: nil, repeats: true)
        }
    }
    
    @objc func tickAction (){ // Called per every tick
        let currentTime = NSDate.timeIntervalSinceReferenceDate
        var elapsedTime = currentTime - startTime
        let minutes = elapsedTime/60.0
        elapsedTime -= TimeInterval(minutes)*60
        let seconds = UInt8(elapsedTime)
        elapsedTime -= TimeInterval(seconds)
        let fraction = UInt8(elapsedTime*100)
        let strM = String(format: "%02d", minutes)
        let strS = String(format: "%02d", seconds)
        let strFrac = String(format: "%02d", fraction)
        timeLabel.text = strM + ":" + strS + ":" + strFrac
    }
    
}

