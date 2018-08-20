//
//  ViewController.swift
//  Egg Timer App
//
//  Created by Андрей Понамарчук on 06/08/2018.
//  Copyright © 2018 Андрей Понамарчук. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    @IBAction func pausePressed(_ sender: UIBarButtonItem) {
        timer.invalidate()
    }
    @IBAction func playPressed(_ sender: UIBarButtonItem) {
        timer.invalidate()
        runTimer()
    }
    @IBAction func minusTenSecondsPressed(_ sender: UIBarButtonItem) {
        changeCurrentTime(for: -10)
    }
    @IBAction func plusTenSecondsPressed(_ sender: UIBarButtonItem) {
        changeCurrentTime(for:  10)
    }
    @IBAction func resetPressed(_ sender: UIBarButtonItem) {
        timer.invalidate()
        timerLabel.text = "210"
        //runTimer()
    }
    @IBOutlet weak var timerLabel: UILabel!
    
    func changeCurrentTime(for seconds: Int) {
        if let currentTimeString = timerLabel.text {
            if let currentTimeInt = UInt(currentTimeString) {
                switch seconds {
                case -1:
                    if currentTimeInt > 0 {
                        timerLabel.text = String(currentTimeInt.advanced(by: seconds))
                    } else {
                        timer.invalidate()
                    }
                case -10:
                    if currentTimeInt > 10 {
                        timerLabel.text = String(currentTimeInt.advanced(by: seconds))
                    } else {
                        timer.invalidate()
                    }
                default:
                    timerLabel.text = String(currentTimeInt.advanced(by: seconds))
                }
            }
        }
    }
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
    }
   
    
    @objc func processTimer() {
        changeCurrentTime(for: -1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timerLabel.text = "210"
        runTimer()
        
        
    }


}

