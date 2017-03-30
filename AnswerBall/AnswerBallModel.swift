//
//  AnswerBallModel.swift
//  AnswerBall
//
//  Created by Reiss Zurbyk on 2016-01-31.
//  Copyright © 2016 Reiss Zurbyk. All rights reserved.
//

import Foundation
import AVFoundation

class   AnswerBallModel : NSObject, AVAudioPlayerDelegate {
    
    var audioPlayer = AVAudioPlayer()
    
    var answers = [
        "I'm not a mindreader!",
        "All indicators point to YES!",
        "All indicators point to NO!",
        "Watch your language!",
        "It seems highly unlikely.",
        "Please speak up!",
        "It seems highly likely.",
        "Yes, indeed!",
        "Absolutely not!",
        "Please ask again later...",
        "Seriously?",
        "That was a dumb question.",
        "I was wondering the same thing!",
        "I can't answer that truthfully.",
        "What do you think?",
        "OMG YES!",
        "OMG NO!",
        "Imagine that!",
        "Really?",
        "Did you just ask that?",
        "Of course.",
        "Ask a higher power.",
        "The force is with you.",
        "The force is not near.",
        "You're unbelievable!",
        "Can I get a translation please?",
        "I'm gonna guess... NO!",
        "I'm gonna guess... YES!",
        "It would seem so.",
        "That does not seem to be true.",
        "Does a bear sh... never mind.",
        "I need a new profession!",
        "The odds are against that.",
        "The odds are in your favor.",
        "Can we skip this one?",
        "Ask a different question please.",
        "I'm doing good, yes I know you didn't ask.",
        "My connection to the stars was lost.",
        "Do you want the truth?",
        "I can see no answer but yes."
    ]
    
    func playSound(_ fileName: String, fileExtension: String) throws {
        
        let dispatchQueue = DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default)
        
        dispatchQueue.async(execute: { let mainBundle = Bundle.main
            
            let filePath = mainBundle.path(forResource: "\(fileName)", ofType:"\(fileExtension)")
            
            if let path = filePath{
                let fileData = try? Data(contentsOf: URL(fileURLWithPath: path))
                
                do {
                    /* Start the audio player */
                    self.audioPlayer = try AVAudioPlayer(data: fileData!)
                    
                    guard let player : AVAudioPlayer? = self.audioPlayer else {
                        return
                    }
                    
                    /* Set the delegate and start playing */
                    player!.delegate = self
                    if player!.prepareToPlay() && player!.play() {
                        /* Successfully started playing */
                    } else {
                        /* Failed to play */
                    }
                    
                } catch {
                    //self.audioPlayer = nil
                    return
                }
                
            }
            
        })
        
    }
    
}
