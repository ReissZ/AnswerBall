//
//  MainVC.swift
//  AnswerBall
//
//  Created by Reiss Zurbyk on 2015-11-23.
//  Copyright © 2015 Reiss Zurbyk. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    var model : AnswerBallModel = AnswerBallModel()
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = "Ask a question!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getAnswerTapped(_ sender: AnyObject) {
        
        //get a random number from ther array count
        
        let random = Int(arc4random_uniform(UInt32(model.answers.count)))
        
        //Display the answer
        
        label.text = model.answers[random]
        
        //Play the sound
        
        do {
            try model.playSound("shakesound", fileExtension: "wav")
        } catch {
            return
        }
        
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        getAnswerTapped(self)
    }
    
    }
