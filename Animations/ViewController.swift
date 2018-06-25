//
//  ViewController.swift
//  Animations
//
//  Created by Adam Moore on 4/4/18.
//  Copyright © 2018 Adam Moore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentFrameNumber = 0
    
    var timer = Timer()
    
    var isAnimating = false
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var startAndStopButtonTitle: UIButton!
    
    @objc func runGif(){
        
        if currentFrameNumber < 10 {
            image.image = UIImage(named: "frame_0\(currentFrameNumber)_delay-0.1s.gif")
        } else {
            image.image = UIImage(named: "frame_\(currentFrameNumber)_delay-0.1s.gif")
        }
        
        currentFrameNumber += 1
        
        if currentFrameNumber > 37 {
            currentFrameNumber = 0
        }
    }

    @IBAction func start(_ sender: UIButton) {
        if !isAnimating {
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.runGif), userInfo: nil, repeats: true)
            
            startAndStopButtonTitle.setTitle("Stop", for: .normal)
            
            isAnimating = true
            
        } else if isAnimating {
            
            timer.invalidate()
            
            startAndStopButtonTitle.setTitle("Start", for: .normal)
            
            isAnimating = false
        }
        
        
    }
    
    @IBAction func fadeIn(_ sender: UIButton) {
        
        image.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.image.alpha = 1
        }
        
    }
    
    @IBAction func slideIn(_ sender: UIButton) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 1) {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        }
        
    }
    
    @IBAction func grow(_ sender: UIButton) {
        
        image.frame = CGRect(x: 20, y: 40, width: 0, height: 0)
        
        UIView.animate(withDuration: 1) {
            
            self.image.frame = CGRect(x: 20, y: 40, width: 335, height: 467)
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

