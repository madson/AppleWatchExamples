//
//  InterfaceController.swift
//  WatchApp Extension
//
//  Created by Madson Cardoso on 9/26/15.
//  Copyright © 2015 Madson. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var counterLabel: WKInterfaceLabel!
    var counter: Int = 0
    
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

    @IBAction func incrementAction() {
        counter++
        counterLabel.setText("\(counter)")
        print("increment count...")
    }
}
