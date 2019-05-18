//
//  ViewController.swift
//  BuildingATimerWithCode
//
//  Created by Josh Bourke on 18/5/19.
//  Copyright © 2019 Josh Bourke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer!
    var seconds = 60.00
    
    let timeLabel = UILabel()
    let startButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timeLabel.text = "60.00"
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 50)
        timeLabel.frame = CGRect(x: self.view.center.x - 75, y: self.view.center.y - 150, width: 150, height: 40)
        self.view.addSubview(timeLabel)
        
        startButton.frame = CGRect(x: view.frame.midX - 175, y: view.frame.midY - 50, width: 100, height: 100)
        
        viewSetUp()
    }
    
    private func viewSetUp(){
        
        let stopButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let restartButton = UIButton(frame: CGRect(x: self.view.frame.midX + 75, y: self.view.frame.midY - 50, width: 100, height: 100))
        
        //Time to start customizing the buttons
        
        startButton.backgroundColor = UIColor.black
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        startButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        startButton.layer.cornerRadius = 20
        
        stopButton.backgroundColor = UIColor.black
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(.white, for: .normal)
        stopButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        stopButton.addTarget(self, action: #selector(stopAction), for: .touchUpInside)
        //This will center the stop button into the middle of the view.
        stopButton.center = self.view.center
        stopButton.layer.cornerRadius = 20
        
        restartButton.backgroundColor = UIColor.black
        restartButton.setTitle("Restart", for: .normal)
        restartButton.setTitleColor(.white, for: .normal)
        restartButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        restartButton.addTarget(self, action: #selector(restartAction), for: .touchUpInside)
        restartButton.layer.cornerRadius = 20
        
        
        self.view.addSubview(startButton)
        self.view.addSubview(stopButton)
        self.view.addSubview(restartButton)
        
    }
    
    @objc func startAction(sender: UIButton){
        //What you want to happen when you press the button
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        //This will stop you from starting another timer if one is already running
        startButton.isEnabled = false
    }
    
    @objc func stopAction(sender: UIButton){
        //What you want to happen when you press the button
        
        //Stops Timer
        timer.invalidate()
        
        //You have to make it active once it is no longer running
        startButton.isEnabled = true
    }
    
    @objc func restartAction(sender: UIButton){
        //What you want to happen when you press the button
        
        //Restart will stop the timer and then reset everthing back to normal.
        seconds = 60.00
        timeLabel.text = "60.00"
        timer?.invalidate()
        
        startButton.isEnabled = true
        
    }
    
    @objc func updateTimer(){
        
        //This is to format the string so that it looks all nice :)
        let myTimerFloat = String(format: "%.2f", seconds)
        seconds -= 0.01
        timeLabel.text = myTimerFloat
        
        if seconds <= 0.01{
            //Stops timer
            timer?.invalidate()
            //Set time back to normal.
            seconds = 60.00
            timeLabel.text = "60.00"
        }
        
    }


}

