//
//  TimerInterfaceController.swift
//  Examples
//
//  Created by Madson Cardoso on 9/27/15.
//  Copyright © 2015 Madson. All rights reserved.
//

import WatchKit
import Foundation


class TimerInterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBOutlet var timer: WKInterfaceTimer!
    
    @IBAction func startTimer() {
        timer.start()
    }
    
    @IBAction func pauseTimer() {
        timer.stop()
    }
    
    @IBAction func resetTimer() {
    }
    
}
