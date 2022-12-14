//
//  ViewController.swift
//  Six Words
//
//  Created by Ed Timmer on 12/7/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var middleImage: UIImageView!
    
    @IBOutlet weak var controlBar: UISegmentedControl!

    
    var index = 0
    let numbers = ["", "1", "2", "3", "4", "5", "6"]
    var isShort = false
    let messagesLong = ["",
                    "Let go of what has passed",
                    "Let go of what may come",
                    "Let go of what is happening now",
                    "Don’t try to figure anything out",
                    "Don’t try to make anything happen",
                    "Relax, right now, and rest"]
    
    let messagesShort = ["",
                    "Don't recall",
                    "Don't imagine",
                    "Don't think",
                    "Don't examine",
                    "Don't control",
                    "Rest"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainLabel.numberOfLines = 6
        mainLabel.text = ""
        numberLabel.text = numbers[index]
        
        controlBar.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)], for: UIControl.State.normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
        
    override open var shouldAutorotate: Bool {
        return false
    }

    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            isShort = false
            mainLabel.text = messagesLong[index]
        }
        else if sender.selectedSegmentIndex == 1 {
            isShort = true
            mainLabel.text = messagesShort[index]
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        if index < 6 {
            index = index + 1
        }
        else { index = 0 }
        
        if isShort {
            mainLabel.text = messagesShort[index]
        } else if !isShort {
            mainLabel.text = messagesLong[index]
        }
        
        numberLabel.text = numbers[index]
        
        if index > 0 {
            middleImage.isHidden = true
        } else {
            middleImage.isHidden = false
        }
    }
}

